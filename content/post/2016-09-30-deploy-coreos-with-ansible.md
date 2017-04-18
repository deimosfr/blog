---
title: Deploy CoreOS with Ansible
author: Deimos
type: post
date: 2016-09-30T21:35:17+00:00
url: /2016/09/30/deploy-coreos-with-ansible/
categories:
  - Ansible
  - Cloud
  - Hi-Tech
  - Linux
tags:
  - nousmotards
image: /images/logo_coreos.png
thumbnailImage: /thumbnails/logo_coreos.png
thumbnailImagePosition: left

---
![CoreOS_logo](/images/logo_coreos.png)
&nbsp;

[CoreOS][1] is a lightweight Linux operating system designed for clustered deployments providing automation, security, and scalability for your most critical applications.&nbsp;I've been playing with [CoreOS][1] to replace Debian hosts which run Docker containers on [Nousmotards][2] project. CoreOS helps on simplifying bare metal deployment and avoid managing OS upgrade.

As I'm still an Ansible lover, I've made 2 roles:

  * [CoreOS Ansible][3]:&nbsp;Ansible role to deploy pypy to CoreOS to be able to get Ansible prerequisites
  * [CoreOS][4]: Ansible CoreOS role to deploy CoreOS on bare metal servers

If you want to quickly look at the result:

<script type="text/javascript" src="https://asciinema.org/a/97137.js" id="asciicast-97137" async></script>

The first one is&nbsp;for installing pypy to run Ansible and the other one to bootstrap CoreOS with Cloudinit or/and Igninition. Those role will bootstrap a complete cluster with etcd, flannel, fleet etc...ready to run a [Kubernetes][5] cluster on it! It will generate configs for each hosts and deploy them automatically. It will permit to add vars, generate the configs and you can keep history with git for example. Here are the options of the role:

{{< highlight yaml >}}
# Choose CoreOS channel between stable, beta or alpha channels
coreos_channel: "stable"
# Generate a token: https://discovery.etcd.io/new?size=3
coreos_token: "81b89915ae4edd9a65ad9d0301381c52"
# Choose reboot strategy between: etcd-lock, reboot and off
coreos_reboot_strategy: "etcd-lock"

# Define your public interface and IP
coreos_public_ip: "{{ansible_default_ipv4.address}}"
coreos_public_if: "{{ansible_default_ipv4.interface}}"
# Define your private interface and IP
coreos_private_ip: "{{priv_ip}}"
coreos_private_if: "{{priv_if}}"

# Define dedicated subnet for containers communication
coreos_flanneld_subnet: "10.1.0.0/16"

# Add fleet metadata
coreos_fleet_metadata: "cluster=dev"

# If true, will bootstrap the server (data may be lost),
# else config files will be generated
coreos_launch_bootstrap: true
coreos_device_install: "/dev/sda"
coreos_install_additional_options: ""
coreos_eject_cd_before_reboot: true
coreos_reboot_after_bootstrap: true

# Dump generated Ingition and Cloudinit configs
coreos_dump_ignition_cloudinit_config: true
coreos_dump_ignition_cloudinit_dest: "{{role_path}}/files/generated_configs"

# Select Timezone
coreos_timezone: "UTC"

# CoreOS toolbox image type
coreos_toolbox_docker_image: "debian"
coreos_toolbox_docker_tag: "stable"

# Ignition
coreos_bootstrap_ignition: false
coreos_ignition:
  ignition:
    version: "2.0.0"
  storage:
    disks:
      - device: "/dev/sdb"
        wipeTable: true
        partitions:
          - label: "data.0"
            number: 1
            size: 0
            start: 0
      - device: "/dev/sdc"
        wipeTable: true
        partitions:
          - label: "data.1"
            number: 1
            size: 0
            start: 0

# Cloudinit
coreos_bootstrap_cloudinit: true
coreos_cloudinit:
  hostname: "{{inventory_hostname}}"
  coreos:
    etcd2:
      discovery: "https://discovery.etcd.io/{{coreos_token}}"
      #name: 'cluster01'
      advertise-client-urls: "http://{{coreos_public_ip}}:2379"
      #initial-cluster-token: 'cluster-prod'
      #initial-cluster-state: "{{coreos_cluster_state}}"
      #initial-cluster: "core01=http://172.17.8.101:2380, core02=http://172.17.8.102:2380, core03=http://172.17.8.103:2380,"
      initial-advertise-peer-urls: "http://{{coreos_private_ip}}:2380"
      listen-peer-urls: "http://{{coreos_private_ip}}:2380,http://{{coreos_private_ip}}:7001"
      listen-client-urls: "http://0.0.0.0:2379,http://0.0.0.0:4001"
    update:
      group: "{{coreos_channel}}"
      reboot-strategy: "{{coreos_reboot_strategy}}"
    fleet:
      public-ip: "{{coreos_public_ip}}"
      metadata: "{{coreos_fleet_metadata}}"
    flannel:
      interface: "{{coreos_public_ip}}"
    units:
    - name: "00-{{coreos_public_if}}.network"
      runtime: true
      content: |
        [Match]
        Name={{coreos_public_if}}
        [Network]
        DHCP=true
    - name: "00-{{coreos_private_if}}.network"
      runtime: true
      content: |
        [Match]
        Name={{coreos_private_if}}
        [Network]
        Address={{coreos_private_ip}}/24
    - name: iptables-restore.service
      enable: true
      command: start
    - name: settimezone.service
      command: start
      content: |
        [Unit]
        Description=Set the time zone
        [Service]
        ExecStart=/usr/bin/timedatectl set-timezone {{coreos_timezone}}
        RemainAfterExit=yes
        Type=oneshot
    - name: systemd-modules-load.service
      command: restart
    - name: systemd-sysctl.service
      command: restart
    - name: systemd-timesyncd.service
      command: start
    - name: etcd2.service
      command: start
    - name: fleet.service
      command: start
    - name: docker.service
      command: start
    - name: flanneld.service
      drop-ins:
      - name: 50-network-config.conf
        content: |
          [Service]
          ExecStartPre=/usr/bin/etcdctl set /coreos.com/network/config '{ "Network": "{{coreos_flanneld_subnet}}" }'
      command: start
    - name: docker-tcp.socket
      command: start
      enable: true
      content: |
        [Unit]
        Description=Docker Socket for the API
        After=mnt-data.mount
        Requires=mnt-data.mount
        [Socket]
        ListenStream=2375
        Service=docker.service
        BindIPv6Only=both
        [Install]
        WantedBy=sockets.target
  write_files:
  - path: "/home/core/.toolboxrc"
    owner: core
    content: |
      TOOLBOX_DOCKER_IMAGE={{coreos_toolbox_docker_image}}
      TOOLBOX_DOCKER_TAG={{coreos_toolbox_docker_tag}}
  - path: /var/lib/iptables/rules-save
    permissions: 0644
    owner: root:root
    content: |
      *filter
      :INPUT DROP [0:0]
      :FORWARD DROP [0:0]
      :OUTPUT ACCEPT [0:0]
      -A INPUT -i lo -j ACCEPT
      -A INPUT -i {{coreos_private_if}} -j ACCEPT
      -A INPUT -i tap0 -p all -j ACCEPT
      -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
      -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
      -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
      -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
      -A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
      -A INPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT
      -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
      COMMIT
  users:
    - name: 'core'
      ssh-authorized-keys:
      - "your ssh key here"

ansible_ssh_user: core
ansible_python_interpreter: "/opt/python/bin/python"
{{< /highlight >}}

Finally call it that way:

{{< highlight yaml >}}
- name: coreos-ansible
  hosts: coreos
  user: core
  become: yes
  gather_facts: False
    serial: 1
  roles:
    - deimosfr.coreos-ansible
  vars:
    ansible_ssh_user: core
    ansible_python_interpreter: "/opt/python/bin/python"

- name: coreos-bootstrap
  hosts: coreos
  user: core
  become: yes
  #become_method: su
  #gather_facts: False
  roles:
    - deimosfr.coreos
  vars:
    ansible_ssh_user: core
    ansible_python_interpreter: "/opt/python/bin/python"
{{< /highlight >}}

Inside this role you'll also find a Vagrantfile to deploy a test cluster easily!

Do not hesitate to give feedback and participate to enhance them :-)

 [1]: https://coreos.com
 [2]: https://www.nousmotards.com
 [3]: https://galaxy.ansible.com/deimosfr/coreos-container-linux/
 [4]: https://galaxy.ansible.com/deimosfr/coreos-ansible/
 [5]: http://kubernetes.io/
