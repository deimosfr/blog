---
author: Deimos
type: post
categories:
  - Ansible
  - Cloud
  - Kubernetes
date: 2017-04-18T20:18:07+02:00
tags:
  - Ansible
  - Cloud
  - Kubernetes
image: /images/logo_kubernetes.png
thumbnailImage: /thumbnails/logo_kubernetes.png
thumbnailImagePosition: left
title: Deploy Kubernetes with Ansible
url: /2017/04/18/deploy-kubernetes-with-ansible/
---

![Kubernetes](/images/logo_kubernetes.png)

[Kubernetes][1] is an open-source system for automating deployment, scaling, and management of containerized applications. I'm using it for [Nousmotards][2] and decided to build an [Ansible role][5] for it to make it simpler to deploy.

Why did I built it as other projects like [Kargo][4] already exists? I just wanted a simple and maintainable role based on CoreOS official documentation. That's what I did:

<script type="text/javascript" src="https://asciinema.org/a/97170.js" id="asciicast-97170" async></script>

This role bootstrap a Kubernetes cluster based on CoreOS Container Linux for production usages. The features are:

* Manage SSL certificats
* Configuration changes made easy (all in config)
* Lot of checks during playbook run
* Manage Kubernetes upgrades
* Deploy Kubernetes DNS and Dashboard

If you want to know more on CoreOS installation with ansible, you can [look at the previous post][3].

If you look at the configuration, it could looks like big, but in fact it's not so complicated if you're a little bit familiar with Kubernetes:
{{< highlight yaml >}}
k8s_version: 'v1.5.1_coreos.0'
k8s_dashboard_version: '1.5.0'

# Master host will ideally be a network load balancer that sits in front of
# them. Alternatively, a DNS name can be configured which will resolve to
# the master IPs
k8s_master_host: 'kub-master-host.myfqdn.com'
k8s_etcd_endpoints: "http://{{ groups['k8s-masters'] | map('extract', hostvars, ['priv_ip']) | join(':2379,http://') }}:2379"
k8s_flanneld_subnet: "10.1.0.0/16"
k8s_pod_network: '10.2.0.0/16'
k8s_service_ip_range: '10.3.0.0/24'
k8s_service_ip: '10.3.0.1'
k8s_dns_service_ip: '10.3.0.10'
k8s_cluster_domain: 'cluster.local'
k8s_kubectl_cluster_name: 'default-cluster'

k8s_adverstise_ip: "{{ansible_enp0s8.ipv4.address}}"
# Leave it blank if you're using flannel, otherwize use cni for Calico
k8s_kublet_network_plugin: ''
# Set to false by default because kubelet-wrapper will handle it
k8s_restart_kubelet: false

# SSL

k8s_role_path: "roles/deimosfr.coreos-kubernetes"
k8s_template_dir: "{{k8s_role_path}}/templates"
k8s_ssl_local_path: "{{k8s_role_path}}/files/ssl/{{k8s_kubectl_cluster_name}}"
k8s_ssl_api_server_path: "{{k8s_ssl_local_path}}/api_servers"
k8s_ssl_workers_path: "{{k8s_ssl_local_path}}/workers"
k8s_ssl_admin_path: "{{k8s_ssl_local_path}}/admins"

k8s_ssl_bytes_encrypt: 2048
k8s_ssl_ca_name: 'ca-key.pem'
k8s_ssl_ca_pem_key_name: 'ca.pem'
k8s_ssl_valid_days: 10000
k8s_ssl_ca_pem_subj: '/CN=kube-ca'

k8s_ssl_apiserver_key_pem_name: 'apiserver-key.pem'
k8s_ssl_apiserver_csr_name: 'apiserver.csr'
k8s_ssl_apiserver_subj: '/CN=kube-apiserver'
k8s_ssl_apiserver_pem_name: 'apiserver.pem'
k8s_ssl_apiserver_days: 10000

k8s_openssl_config:
  req:
    req_extensions: 'v3_req'
    distinguished_name: 'req_distinguished_name'
  req_distinguished_name:
  v3_req:
    basicConstraints: 'CA:FALSE'
    keyUsage: 'nonRepudiation, digitalSignature, keyEncipherment'
    subjectAltName: '@alt_names'
  alt_names:
    DNS:
      - kubernetes
      - kubernetes.default
      - kubernetes.default.svc
      - "kubernetes.default.svc.{{k8s_cluster_domain}}"
      - "*.myfqdn.com"
    # Do not fulfil IP of master nodes, they'll be automatically generated
    # from k8s-masters group
    IP:
      - "{{k8s_service_ip}}"

k8s_workers_openssl_config:
  req:
    req_extensions: 'v3_req'
    distinguished_name: 'req_distinguished_name'
  req_distinguished_name:
  v3_req:
    basicConstraints: 'CA:FALSE'
    keyUsage: 'nonRepudiation, digitalSignature, keyEncipherment'
    subjectAltName: '@alt_names'
  # Do not fulfil alt_names, it will automatically be generated
  alt_names:

k8s_kube_apiserver:
  apiVersion: v1
  kind: Pod
  metadata:
    name: kube-apiserver
    namespace: kube-system
  spec:
    hostNetwork: true
    containers:
    - name: kube-apiserver
      image: "quay.io/coreos/hyperkube:{{k8s_version}}"
      command:
      - /hyperkube
      - apiserver
      - --bind-address=0.0.0.0
      - --etcd-servers={{k8s_etcd_endpoints}}
      - --allow-privileged=true
      - --service-cluster-ip-range={{k8s_service_ip_range}}
      - --secure-port=443
      - --advertise-address={{k8s_adverstise_ip}}
      - --admission-control=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota
      - --tls-cert-file=/etc/kubernetes/ssl/{{k8s_ssl_apiserver_pem_name}}
      - --tls-private-key-file=/etc/kubernetes/ssl/{{k8s_ssl_apiserver_key_pem_name}}
      - --client-ca-file=/etc/kubernetes/ssl/{{k8s_ssl_ca_pem_key_name}}
      - --service-account-key-file=/etc/kubernetes/ssl/{{k8s_ssl_apiserver_key_pem_name}}
      - --runtime-config=extensions/v1beta1=true,extensions/v1beta1/networkpolicies=true
      livenessProbe:
        httpGet:
          host: 127.0.0.1
          port: 8080
          path: /healthz
        initialDelaySeconds: 15
        timeoutSeconds: 15
      ports:
      - containerPort: 443
        hostPort: 443
        name: https
      - containerPort: 8080
        hostPort: 8080
        name: local
      volumeMounts:
      - mountPath: /etc/kubernetes/ssl
        name: ssl-certs-kubernetes
        readOnly: true
      - mountPath: /etc/ssl/certs
        name: ssl-certs-host
        readOnly: true
    volumes:
    - hostPath:
        path: /etc/kubernetes/ssl
      name: ssl-certs-kubernetes
    - hostPath:
        path: /usr/share/ca-certificates
      name: ssl-certs-host

k8s_kube_proxy_masters:
  apiVersion: v1
  kind: Pod
  metadata:
    name: kube-proxy
    namespace: kube-system
  spec:
    hostNetwork: true
    containers:
    - name: kube-proxy
      image: "quay.io/coreos/hyperkube:{{k8s_version}}"
      command:
      - /hyperkube
      - proxy
      - --master=http://127.0.0.1:8080
      - --proxy-mode=iptables
      securityContext:
        privileged: true
      volumeMounts:
      - mountPath: /etc/ssl/certs
        name: ssl-certs-host
        readOnly: true
    volumes:
    - hostPath:
        path: /usr/share/ca-certificates
      name: ssl-certs-host

k8s_kube_proxy_workers:
  apiVersion: v1
  kind: Pod
  metadata:
    name: kube-proxy
    namespace: kube-system
  spec:
    hostNetwork: true
    containers:
    - name: kube-proxy
      image: "quay.io/coreos/hyperkube:{{k8s_version}}"
      command:
      - /hyperkube
      - proxy
      - --master=https://{{k8s_master_host}}
      - --kubeconfig=/etc/kubernetes/worker-kubeconfig.yaml
      - --proxy-mode=iptables
      securityContext:
        privileged: true
      volumeMounts:
        - mountPath: /etc/ssl/certs
          name: "ssl-certs"
        - mountPath: /etc/kubernetes/worker-kubeconfig.yaml
          name: "kubeconfig"
          readOnly: true
        - mountPath: /etc/kubernetes/ssl
          name: "etc-kube-ssl"
          readOnly: true
    volumes:
      - name: "ssl-certs"
        hostPath:
          path: "/usr/share/ca-certificates"
      - name: "kubeconfig"
        hostPath:
          path: "/etc/kubernetes/worker-kubeconfig.yaml"
      - name: "etc-kube-ssl"
        hostPath:
          path: "/etc/kubernetes/ssl"

k8s_kube_controller_manager:
  apiVersion: v1
  kind: Pod
  metadata:
    name: kube-controller-manager
    namespace: kube-system
  spec:
    hostNetwork: true
    containers:
    - name: kube-controller-manager
      image: "quay.io/coreos/hyperkube:{{k8s_version}}"
      command:
      - /hyperkube
      - controller-manager
      - --master=http://127.0.0.1:8080
      - --leader-elect=true
      - --service-account-private-key-file=/etc/kubernetes/ssl/{{k8s_ssl_apiserver_key_pem_name}}
      - --root-ca-file=/etc/kubernetes/ssl/{{k8s_ssl_ca_pem_key_name}}
      livenessProbe:
        httpGet:
          host: 127.0.0.1
          path: /healthz
          port: 10252
        initialDelaySeconds: 15
        timeoutSeconds: 1
      volumeMounts:
      - mountPath: /etc/kubernetes/ssl
        name: ssl-certs-kubernetes
        readOnly: true
      - mountPath: /etc/ssl/certs
        name: ssl-certs-host
        readOnly: true
    volumes:
    - hostPath:
        path: /etc/kubernetes/ssl
      name: ssl-certs-kubernetes
    - hostPath:
        path: /usr/share/ca-certificates
      name: ssl-certs-host

k8s_kube_scheduler:
  apiVersion: v1
  kind: Pod
  metadata:
    name: kube-scheduler
    namespace: kube-system
  spec:
    hostNetwork: true
    containers:
    - name: kube-scheduler
      image: "quay.io/coreos/hyperkube:{{k8s_version}}"
      command:
      - /hyperkube
      - scheduler
      - --master=http://127.0.0.1:8080
      - --leader-elect=true
      livenessProbe:
        httpGet:
          host: 127.0.0.1
          path: /healthz
          port: 10251
        initialDelaySeconds: 15
        timeoutSeconds: 1

k8s_worker_kubeconfig:
  apiVersion: v1
  kind: Config
  clusters:
  - name: local
    cluster:
      certificate-authority: /etc/kubernetes/ssl/ca.pem
      server: "https://{{k8s_master_host}}:443"
  users:
  - name: kubelet
    user:
      client-certificate: /etc/kubernetes/ssl/worker.pem
      client-key: /etc/kubernetes/ssl/worker-key.pem
  contexts:
  - context:
      cluster: local
      user: kubelet
    name: kubelet-context
  current-context: kubelet-context

# 3rd party apps

k8s_dns_service:
  apiVersion: v1
  kind: Service
  metadata:
    name: kube-dns
    namespace: kube-system
    labels:
      k8s-app: kube-dns
      kubernetes.io/cluster-service: "true"
      kubernetes.io/name: "KubeDNS"
  spec:
    selector:
      k8s-app: kube-dns
    clusterIP: "{{k8s_dns_service_ip}}"
    ports:
    - name: dns
      port: 53
      protocol: UDP
    - name: dns-tcp
      port: 53
      protocol: TCP

k8s_dns_replication_controller:
  apiVersion: v1
  kind: ReplicationController
  metadata:
    name: kube-dns-v20
    namespace: kube-system
    labels:
      k8s-app: kube-dns
      version: v20
      kubernetes.io/cluster-service: "true"
  spec:
    replicas: 1
    selector:
      k8s-app: kube-dns
      version: v20
    template:
      metadata:
        labels:
          k8s-app: kube-dns
          version: v20
        annotations:
          scheduler.alpha.kubernetes.io/critical-pod: ''
          scheduler.alpha.kubernetes.io/tolerations: '[{"key":"CriticalAddonsOnly", "operator":"Exists"}]'
      spec:
        containers:
        - name: kubedns
          image: gcr.io/google_containers/kubedns-amd64:1.9
          resources:
            limits:
              memory: 170Mi
            requests:
              cpu: 100m
              memory: 70Mi
          livenessProbe:
            httpGet:
              path: /healthz-kubedns
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 60
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 5
          readinessProbe:
            httpGet:
              path: /readiness
              port: 8081
              scheme: HTTP
            initialDelaySeconds: 3
            timeoutSeconds: 5
          args:
            - "--domain={{k8s_cluster_domain}}."
            - --dns-port=10053
          ports:
          - containerPort: 10053
            name: dns-local
            protocol: UDP
          - containerPort: 10053
            name: dns-tcp-local
            protocol: TCP
        - name: dnsmasq
          image: gcr.io/google_containers/kube-dnsmasq-amd64:1.4
          livenessProbe:
            httpGet:
              path: /healthz-dnsmasq
              port: 8080
              scheme: HTTP
            initialDelaySeconds: 60
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 5
          args:
          - --cache-size=1000
          - --no-resolv
          - --server=127.0.0.1#10053
          - --log-facility=-
          ports:
          - containerPort: 53
            name: dns
            protocol: UDP
          - containerPort: 53
            name: dns-tcp
            protocol: TCP
        - name: healthz
          image: gcr.io/google_containers/exechealthz-amd64:1.2
          resources:
            limits:
              memory: 50Mi
            requests:
              cpu: 10m
              memory: 50Mi
          args:
          - "--cmd=nslookup kubernetes.default.svc.{{k8s_cluster_domain}} 127.0.0.1 >/dev/null"
          - --url=/healthz-dnsmasq
          - "--cmd=nslookup kubernetes.default.svc.{{k8s_cluster_domain}} 127.0.0.1:10053 >/dev/null"
          - --url=/healthz-kubedns
          - --port=8080
          - --quiet
          ports:
          - containerPort: 8080
            protocol: TCP
        dnsPolicy: Default

k8s_dashboard_deployment:
  kind: Deployment
  apiVersion: extensions/v1beta1
  metadata:
    labels:
      app: kubernetes-dashboard
    name: kubernetes-dashboard
    namespace: kube-system
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: kubernetes-dashboard
    template:
      metadata:
        labels:
          app: kubernetes-dashboard
        annotations:
          scheduler.alpha.kubernetes.io/tolerations: |
            [
              {
                "key": "dedicated",
                "operator": "Equal",
                "value": "master",
                "effect": "NoSchedule"
              }
            ]
      spec:
        containers:
        - name: kubernetes-dashboard
          image: "gcr.io/google_containers/kubernetes-dashboard-amd64:v{{k8s_dashboard_version}}"
          imagePullPolicy: Always
          resources:
            limits:
              cpu: 100m
              memory: 50Mi
            requests:
              cpu: 100m
              memory: 50Mi
          ports:
          - containerPort: 9090
            protocol: TCP
          args:
            # Uncomment the following line to manually specify Kubernetes API server Host
            # If not specified, Dashboard will attempt to auto discover the API server and connect
            # to it. Uncomment only if the default does not work.
            # - --apiserver-host=http://my-address:port
          livenessProbe:
            httpGet:
              path: /
              port: 9090
            initialDelaySeconds: 30
            timeoutSeconds: 30

k8s_dashboard_service:
  apiVersion: v1
  kind: Service
  metadata:
    name: kubernetes-dashboard
    namespace: kube-system
    labels:
      k8s-app: kubernetes-dashboard
      kubernetes.io/cluster-service: "true"
  spec:
    selector:
      k8s-app: kubernetes-dashboard
    ports:
    - port: 80
      targetPort: 9090
{{< /highlight >}}

If you need more information with a Vagrant test, you can take a look at the repository and [Ansible galaxy][5].

 [1]: https://kubernetes.io/
 [2]: https://www.nousmotards.com
 [3]: https://blog.deimos.fr/2016/09/30/deploy-coreos-with-ansible/
 [4]: https://github.com/kubernetes-incubator/kargo
 [5]: https://galaxy.ansible.com/deimosfr/coreos-kubernetes/
