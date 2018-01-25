---
author: Deimos
type: post
categories:
  - Kubernetes
  - Docker
  - Containers
  - Registry
date: 2018-01-28T18:00:00+02:00
tags:
  - Kubernetes
  - Docker
  - Containers
  - Registry
image: /images/logo_gcr.png
thumbnailImage: /thumbnails/logo_gcr.png
thumbnailImagePosition: left
title: Integrate GCR on your on premise k8s cluster
url: /2018/01/28/integrate-gcr-in-your-on-premise-kubernetes/

---

![Google Cloud Registry](/images/logo_gcr.png)

I'm using Kubernetes on an on premise cluster for [MySocialApp][6]. Today, I'm storing [MySocialApp public images][10] at Quay.io and I also wanted to store private images. I didn't want to bootstrap a private registry for it to avoid maintaining it, having a distributed storage to maintain for it etc...but wanted a solution at a lower cost.

I started to look at [DockerHub][1] and [Quay.io][2]. As far aas I saw, DockerHub do not provide private registry while Quay does. And it could be great as I'm already storing public images there. However private repositories are coming with an expensive price (starting at 15$/month for only 5 repos). I really don't like this pricing model.

I then looked at Cloud providers. There is the well known [Google Cloud Registry][3] (aka GCR) and [Amazon ECR][4]. They are cheaper if you only use them to store images and have a registry (and of course if you don't store Petabytes of containers). Note: If you want them to build your images, you have to add another service, but I didn't dig much into it as I'm already using [Gitlab CI][5] to build images.

What I like in [GCR][3] and [ECR][4] is you pay what you're consuming. I've chosen GCR as several public repository related to kubernetes are stored there and it's really cheaper than Quay.io. I have ~20 private repos, here is the bill for 1 month:

![GCR pricing](/images/gcr_pricing.png)

Now let's try to set it up! Unfortunately the reality is more complex than what I though, when you do not run your Kubernetes inside a Cloud.

I spent several hours to understand how it works to add a GCR secret key in a namespace and being able to use it. I appears that the Google documentation is not up to date, I found several cases of people encountering the same issue without any long term solution. A working solution is to use temporary access key and renew it regularely. It looks like to be the same mechanism for [ECR][4].

Before coding something, I made a quick search and found a nice project called [registry-creds][7] that already do that kind of stuff and in addition, propagate your GCR secrets automatically to all namespaces! More than that, it supports natively GCR and ECR ! Great ! (La cerise sur le McDo!)

So I made a [helm chart for it][8]. To use it, you first need to get your default credentials (on your computer) made by installing [gcloud][9] the first time you launched it and convert the key into base64:

{{< highlight shell>}}
base64 -w 0 ~/.config/gcloud/application_default_credentials.json
{{< /highlight >}}

Then add the returned content, to the key "registryCredsAppDefaultCredsJson" inside value.yaml of the [registry-creds-gcr chart][8]:

{{< highlight yaml>}}
registryCredsReplicaCount: 1
registryCredsNodeSelector:
  node-role.kubernetes.io/node: "true"

registryCredsImageVersion: 1.8
registryCredsAppDefaultCredsJson: "paste here"
{{< /highlight >}}

Then deploy the chart and all your namespaces will have a new secret (gcr-secret):

{{< highlight shell>}}
$ kubectl get secret
NAME                  TYPE                                  DATA      AGE
default-token-qlql9   kubernetes.io/service-account-token   3         37d
gcr-secret            kubernetes.io/dockercfg               1         21d
{{< /highlight >}}

We're now ready to deploy private images hosted on [GCR][3]! Let's take a basic example of a pod, you just need to add the "imagePullSecret" information to pass the secret key to the pod:

{{< highlight yaml>}}
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  imagePullSecrets:
    - name: gcr-secret
  containers:
  - name: private-container
    image: gcr.io/project_id/image_name:version
    ports:
    - containerPort: 80
{{< /highlight >}}

You can deploy now, it will work :)

 [1]: https://hub.docker.com/
 [2]: https://quay.io/
 [3]: https://cloud.google.com/container-registry
 [4]: https://aws.amazon.com/fr/ecr/
 [5]: https://about.gitlab.com/features/gitlab-ci-cd/
 [6]: https://mysocialapp.io
 [7]: https://github.com/upmc-enterprises/registry-creds
 [8]: https://github.com/MySocialApp/kubernetes-helm-chart-registry-creds-gcr
 [9]: https://cloud.google.com/sdk/gcloud/
 [10]: https://quay.io/organization/mysocialapp
