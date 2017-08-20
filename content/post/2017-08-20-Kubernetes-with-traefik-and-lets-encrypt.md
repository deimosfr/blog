---
author: Deimos
type: post
categories:
  - Kubernetes
  - SSL
  - Let's Encrypt
  - Consul
  - Traefik
date: 2017-08-20T14:58:07+02:00
tags:
  - Kubernetes
  - SSL
  - Let's Encrypt
  - Consul
  - Traefik
image: /images/logo_traefik.png
thumbnailImage: /thumbnails/logo_traefik.png
thumbnailImagePosition: left
title: Kubernetes with Traefik and Let's Encrypt
url: /2017/08/20/kubernetes-with-traefik-and-lets-encrypt
---

![Traefik](/images/logo_traefik.png)

[Traefik][1] (pronounced like traffic) is a modern HTTP reverse proxy and load balancer made to deploy
microservices with ease. It supports several backends (Docker, Swarm, Kubernetes, Marathon, Mesos, Consul, Etcd,
Zookeeper, BoltDB, Eureka, Amazon DynamoDB, Rest API, file…) to manage its configuration automatically and dynamically.

I wanted to deploy it on Kubernetes for its interesting features like:

* Connect to Kubernetes API to listen changes and perform on the fly updates
* Automatic SSL management through Let's encrypt (SNI)
* Prometheus native integration
* HTTP/2 support

I really like HAProxy, but in a Kubernetes case, it's not the recommended solution because of its lake of features.
Traefik should be get less performance, but the features it provides really match Kubernetes integration.

First of all, I wanted to use Etcd as the backend to store SSL certificates and configuration.
However, there's [an issue in progress][2] on the Go libkv and etcd v3.
As I'm using Kubernetes 1.7 and etcd v3, I had to find another backend. The one I know well is consul and I decided to
switch to it while waiting the fix.

I'll show in that post how I did, to make it works. If you're following me, you'll remind that I'm not using a cloud but
a bare metal installation of Kubernetes. As I'm not using a shared storage for the moment, I'm storing data locally on a
specific servers labeled:
{{< highlight shell >}}
kubectl label nodes srv1 srv2 srv3 consul=server
{{< /highlight >}}

Then I'll need a headless ('clusterIP: None') service to be used by a StatefulSet Consul type:
{{< highlight yaml >}}
apiVersion: v1
kind: Service
metadata:
  name: consul
  namespace: kube-system
  labels:
    consul: server
spec:
  clusterIP: None
  ports:
    - name: http
      port: 8500
      targetPort: 8500
    - name: https
      port: 8443
      targetPort: 8443
    - name: rpc
      port: 8400
      targetPort: 8400
    - name: serflan-tcp
      protocol: "TCP"
      port: 8301
      targetPort: 8301
    - name: serflan-udp
      protocol: "UDP"
      port: 8301
      targetPort: 8301
    - name: serfwan-tcp
      protocol: "TCP"
      port: 8302
      targetPort: 8302
    - name: serfwan-udp
      protocol: "UDP"
      port: 8302
      targetPort: 8302
    - name: server
      port: 8300
      targetPort: 8300
    - name: consuldns
      port: 8600
      targetPort: 8600
  selector:
    consul: server
{{< /highlight >}}
This is needed to be able to access with the help of DNS to the wished instance name (ex: consul-0.consul.kube-system.svc.cluster.local).

Now I'm ready to bootstrap the Consul cluster. To do so, I'm using this StatefulSet configuration:
{{< highlight yaml >}}
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  name: consul
  namespace: kube-system
spec:
  serviceName: consul
  replicas: 3
  template:
    metadata:
      labels:
        consul: server
    spec:
      nodeSelector:
        consul: server
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector:
                matchExpressions:
                  - key: consul
                    operator: In
                    values:
                      - server
              topologyKey: kubernetes.io/hostname
      terminationGracePeriodSeconds: 10
      securityContext:
        fsGroup: 1000
      containers:
      - name: consul
        image: consul:0.9.2
        args:
        - "agent"
        - "-advertise=$(POD_IP)"
        - "-bind=0.0.0.0"
        - "-bootstrap-expect=3"
        - "-retry-join=consul-0.consul.$(NAMESPACE).svc.cluster.local"
        - "-retry-join=consul-1.consul.$(NAMESPACE).svc.cluster.local"
        - "-retry-join=consul-2.consul.$(NAMESPACE).svc.cluster.local"
        - "-client=0.0.0.0"
        - "-datacenter=fr"
        - "-data-dir=/consul/data"
        - "-domain=cluster.local"
        - "-server"
        - "-ui"
        - "-disable-host-node-id"
        ports:
        - containerPort: 8500
          name: ui-port
        - containerPort: 8400
          name: alt-port
        - containerPort: 53
          name: udp-port
        - containerPort: 8443
          name: https-port
        - containerPort: 8080
          name: http-port
        - containerPort: 8301
          name: serflan
        - containerPort: 8302
          name: serfwan
        - containerPort: 8600
          name: consuldns
        - containerPort: 8300
          name: server
        env:
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        - name: NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        lifecycle:
          preStop:
            exec:
              command:
              - /bin/sh
              - -c
              - consul leave
        volumeMounts:
        - name: ca-certificates
          mountPath: /etc/ssl/certs
        - name: consul-data
          mountPath: /consul/data
      volumes:
      - name: ca-certificates
        hostPath:
          path: /usr/share/ca-certificates/
      - name: consul-data
        hostPath:
          path: /mnt/consul
{{< /highlight >}}

After a few seconds (look at the logs), your cluster should be ready.

It's time to prepare your Traefik configuration which we will push into Consul (Traefik is unfortunately not able to
read Kubernetes configmaps for the moment).

My Traefik configmap looks like this:
{{< highlight yaml >}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: traefik
  namespace: kube-system
data:
  traefik.toml: |-
    checkNewVersion = false
    IdleTimeout = "180s"
    MaxIdleConnsPerHost = 500
    logLevel = "INFO"
    defaultEntryPoints = ["http", "https"]

    [retry]
    attempts = 3

    [web]
    address = ":8081"

    [kubernetes]
    endpoint = "http://localhost:8080"
    namespaces = ["default"]

    [consul]
    endpoint = "consul:8500"
    watch = true
    prefix = "traefik"

    [acme]
    email = "my@email.here"
    storage = "traefik/acme/account"
    entryPoint = "https"
    OnHostRule = true
    onDemand = true
    acmeLogging = true
    #caServer = "https://acme-staging.api.letsencrypt.org/directory"

    [[acme.domains]]
       main = "mydomain.fqdn"

    [entryPoints]
      [entryPoints.http]
      address = ":80"
      compress = true
        [entryPoints.http.redirect]
        entryPoint = "https"
      [entryPoints.https]
      address = ":443"
        [entryPoints.https.tls]
  resolv.conf: |-
    nameserver 10.3.0.10
    search kube-system.svc.cluster.local svc.cluster.local cluster.local
    options ndots:5
{{< /highlight >}}
To get more information on it, please look at the [good Traefik documentation][3]. You'll see why there is resolv.conf
later in this post. This Traefik configuration give the Traefik we interface on port 8081, connects to Kubernetes on
localhost and port 8080, connects to Consul using the headless service, manages let's encrypt certificates and redirect
http to https.

Note: if you just want to test, you can uncomment the caServer line. But you'll need to remove completely the imported
traefik configuration in Consul when you'll be ready to go prod (and of course remove this line).

Now let's run the job which will push this configuration into the Consul KV:
{{< highlight yaml >}}
apiVersion: batch/v1
kind: Job
metadata:
  name: traefik-boostrap
  namespace: kube-system
spec:
  template:
    metadata:
      name: traefik-boostrap
    spec:
      containers:
      - image: traefik:v1.3-alpine
        name: traefik-bootstrap
        args:
        - storeconfig
        - --configfile=/etc/traefik/traefik.toml
        volumeMounts:
        - name: traefik-config
          mountPath: /etc/traefik
      restartPolicy: Never
      volumes:
      - name: traefik-config
        configMap:
          name: traefik
{{< /highlight >}}

Traefik is now ready to be deployed. We need a service account:
{{< highlight yaml >}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: traefik-ingress-controller
  namespace: kube-system
{{< /highlight >}}

And the service for the web admin interface:
{{< highlight yaml >}}
apiVersion: v1
kind: Service
metadata:
  name: traefik-web-ui
  namespace: kube-system
spec:
  selector:
    k8s-app: traefik-ingress-lb
  ports:
  - name: web
    port: 80
    targetPort: 8081
{{< /highlight >}}

Just before deploying Traefik, there is a small bug to workaround before going ahead. A key in the Consul KV store should be
deleted:
{{< highlight bash >}}
kubectl --namespace kube-system exec -it consul-0 consul kv delete traefik/acme/storagefile
{{< /highlight >}}

I'm using a daemonset for Traefik as I want it to run on a ll my Kubernetes nodes:
{{< highlight yaml >}}
kind: DaemonSet
apiVersion: extensions/v1beta1
metadata:
  name: traefik-ingress-controller
  namespace: kube-system
  labels:
    k8s-app: traefik-ingress-lb
spec:
  template:
    metadata:
      labels:
        k8s-app: traefik-ingress-lb
        name: traefik-ingress-lb
    spec:
      serviceAccountName: traefik-ingress-controller
      terminationGracePeriodSeconds: 60
      hostNetwork: true
      containers:
      - image: traefik:v1.3-alpine
        name: traefik-ingress-lb
        command:
          - "/bin/sh"
          - "-c"
          - "cat /etc/resolvconf/resolv.conf > /etc/resolv.conf ; /entrypoint.sh --consul --consul.endpoint=consul:8500"
        resources:
          limits:
            cpu: 200m
            memory: 30Mi
          requests:
            cpu: 100m
            memory: 20Mi
        ports:
        - name: http
          hostPort: 80
          containerPort: 80
        - name: https
          hostPort: 443
          containerPort: 443
        - name: admin
          containerPort: 8081
        securityContext:
          privileged: true
        volumeMounts:
        - name: traefik-config
          mountPath: /etc/resolvconf
      volumes:
      - name: traefik-config
        configMap:
          name: traefik
          items:
          - key: resolv.conf
            path: resolv.conf
{{< /highlight >}}
If you're encountering an issue with port 443 already in use, you'll have to update the Kubernetes API default port to
another one.

You can see the resolv.conf override here because when we're using "hostNetwork: true", we'll get back resolv.conf from
the host and not the one generated by Kubernetes. Without this, you won't be able to contact Consul endpoint.

Now you're done ! You can create ingress services :-). Here is an example of a full service:
{{< highlight yaml >}}
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: hostnames
  namespace: default
  labels:
    app: hostnames
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: hostnames
    spec:
      hostNetwork: true
      containers:
      - name: hostnames
        image: gcr.io/google_containers/serve_hostname
        ports:
        - containerPort: 9376
          hostPort: 9376
---
apiVersion: v1
kind: Service
metadata:
  name: hostnames
  namespace: default
spec:
  selector:
    app: hostnames
  ports:
  - name: default
    port: 80
    targetPort: 9376
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: hostnames
  namespace: default
  annotations:
    kubernetes.io/ingress.class: "traefik"
spec:
  rules:
  - host: test.mydomain.fqdn
    http:
      paths:
      - path: /
        backend:
          serviceName: hostnames
          servicePort: 80
{{< /highlight >}}

Connect to http://test.mydomain.fqdn, you will be redirected to https://test.mydomain.fqdn. The first connexion may take
some seconds because of the generation of the SSL certificate.

 [1]: https://traefik.io/
 [2]: https://github.com/containous/traefik/issues/926
 [3]: http://docs.traefik.io/toml/
