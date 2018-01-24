---
author: Deimos
type: post
categories:
  - Kubernetes
  - SSL
  - Let's Encrypt
  - Consul
  - Traefik
  - Helm
date: 2018-01-23T18:00:00+02:00
tags:
  - Kubernetes
  - SSL
  - Let's Encrypt
  - Consul
  - Traefik
  - Helm
image: /images/logo_helm.png
thumbnailImage: /thumbnails/logo_helm.png
thumbnailImagePosition: left
title: Traefik HA Helm chart with Let's Encrypt on Kubernetes
url: /2018/01/23/traefik-ha-helm-chart-with-le-on-k8s/

---

![Traefik](/images/logo_traefik.png)

[Traefik][1] (pronounced like traffic) is a modern HTTP reverse proxy and load balancer made to deploy
microservices with ease. It supports several backends (Docker, Swarm, Kubernetes, Marathon, Mesos, Consul, Etcd,
Zookeeper, BoltDB, Eureka, Amazon DynamoDB, Rest API, file…) to manage its configuration automatically and dynamically.

[In a previous post][2], I explained how to manually deploy it in HA mode. For [MySocialApp][3] (iOS and Android social app builder - SaaS), I had to automate it. That's why I used [Helm][4].

Where was the complexity? Bootstraping Traefik in HA mode require to push (only the first time) the configuration you've made to Consul KV store.
I wanted to get rid of that manual boostraping part. In addition, all pods are booting at the same time and that make it more difficult.

To avoid multiple bootstrap at the same time, I used the [distributed lock mechanism in Consul][5]. So when they all start, I randomize the start time and then request a lock. Here is the code:

{{< highlight shell >}}
#!/bin/bash
nodes=( consul-0.{{ .Values.traefikConsulServiceName }} consul-1.{{ .Values.traefikConsulServiceName }} consul-2.{{ .Values.traefikConsulServiceName }} {{ .Values.traefikConsulServiceName }} )
bootstraped=0
contacted=0
# Look at first 3 nodes + 1 on service name (in case of first 3 nodes are down) if bootstrap has not already been done
for node in "${nodes[@]}" ; do
  # Check consul port is open
  nc -z ${node}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }} 8500
  if [ $? -eq 0 ] ; then
    contacted=1
    # If acme folder exist, that mean a bootstrap already occured
    if [ $(curl http://${node}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/kv/traefik/acme/ 2>/dev/null | wc -c) -ne 0 ] ; then
      bootstraped=1
    fi
  fi
  sleep 1
done
# Check if boostrap has already been done
if [ $bootstraped -eq 1 ] ; then
  echo "Traefik config already exists, no need to bootrap"
  exit 0
fi
# Check if connection of one of the previous nodes succeed
if [ $contacted -eq 0 ] ; then
  echo "Wasn't able to target one node in the nodes list"
  exit 1
fi
# Check once again consul-0 pod availability before requesting lock (bootstrap only on consul-0 to get a node lock)
nc -z consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }} 8500
if [ $? -ne 0 ] ; then
  echo "Should exit, couldn't locate consul pod: consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }} port 8500"
  exit 1
fi
# Get session ID
id=$(curl -XPUT http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/session/create 2>/dev/null | jq -r '.ID')
# Check if a lock has been acquired and get one if not the case to bootstrap
if [ "$(curl -XPUT http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/kv/locks/traefik-bootstrap/.lock\?acquire=$id -d $(hostname) 2>/dev/null)" == "true" ] ; then
  echo "Traefik bootstrap"
  traefik storeconfig --configfile=/etc/traefik/traefik.toml && \
  curl -XDELETE http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/kv/traefik/acme/storagefile 2>/dev/null
  # Release lock and delete kv entry
  curl -XPUT "http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/kv/locks/traefik-bootstrap/.lock\?acquire=$id" 2>/dev/null
else
  # Wait until bootstrap ended
  counter=0
  while [ $(curl http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/kv/traefik/acme/ 2>/dev/null | wc -c) -eq 0 ] ; do
    if [[ "$counter" -gt 300 ]]; then
      echo "After 1 min, the traefik bootstrap has not been done, exiting"
      exit 1
    fi
    sleep 2
    counter=$((counter+1))
  done
fi
# Delete session
curl -XPUT "http://consul-0.{{ .Values.traefikConsulServiceName }}.{{ .Release.Namespace }}.svc.{{ .Values.traefikResolvConfDomainNameCluster }}:8500/v1/session/destroy/$id" 2>/dev/null
echo "Bootstrap has already been done, traefik container will start"
exit 0
{{< /highlight >}}

Now if you deploy this chart for the first time or not, you won't need any manual intervention anymore :)

Before deploying it, you will need a consul cluster setup and ready. If you're searching for a [Consul Helm chart][6], I've made one also for [MySocialApp][3]. We're using this chart on bare metal with local storage. We recommend that consul servers are used with "Node Selector" option to stick to specific servers.

Then you have to update "values.yaml" from the [Traefik chart][7] file before deloying. You're now ready to go.

 [1]: https://traefik.io/
 [2]: {{< ref "2017-08-20-Kubernetes-with-traefik-and-lets-encrypt.md" >}}
 [3]: https://mysocialapp.io/
 [4]: https://docs.helm.sh/
 [5]: https://www.consul.io/docs/guides/semaphore.html
 [6]: https://github.com/MySocialApp/kubernetes-helm-chart-consul
 [7]: https://github.com/MySocialApp/kubernetes-helm-chart-traefik
