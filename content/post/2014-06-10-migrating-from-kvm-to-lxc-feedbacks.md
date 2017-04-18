---
title: Migrating from KVM to LXC…feedbacks
author: Deimos
type: post
date: 2014-06-10T10:00:00+00:00
url: /2014/06/10/migrating-from-kvm-to-lxc-feedbacks/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
  - LXC
  - Virtualization
tags:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
  - LXC
  - Virtualization

---
![Poweredbylinux](/images/Poweredbylinux.jpg)
I recently migrated this server to a new one. New hardware, better performance, less power consumption etc...Thanks [Online](http://www.online.net/fr).

I'm already using LXC on my home server and see the benefits for 8 months ago. That's why I decided to migrate this server to LXC as well. The difference here is that I wanted to **migrate my VM from KVM**. All my [KVM](https://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM) VM are on Debian Wheezy so that was pretty easy.

First of all I used [Preseed to quickly deploy Debian](https://wiki.deimos.fr/Automatiser_une_installation_de_Debian) on the host...as minimal as possible. Then I've made an [LXC Ansible playbook (available on Ansible Galaxy)](https://galaxy.ansible.com/deimosfr/lxc/) to be able to quickly deploy the server. I encountered several little issues and [pushed the fixes to my repository on GitHub](https://github.com/deimosfr/ansible-lxc) (linked to my Ansible Galaxy account).

I had to make the iptables configuration to forward incoming connections to my NATed containers. This is not managed by the LXC playbook as it doesn't have to in my opinion. [But you could find examples on my documentation if you need](https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Network).

I wanted to manage the deployment of my LXC containers with Ansible, however I didn't had the time to do it. So I concentrated more on migrating my running KVM VMs to the LXC server.

Then [I've followed the doc I've made to convert an existing system to an LXC container](https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Convert.2FMigrate_a_VM.2FHost_to_a_LXC_container). Was working like a charm. To resume:

  1. I made an rsync copy to the remote rootfs destination
  2. Stopped all running services on the KVM VM and returned an rsync. This to avoid issues with a running MariaDB for example.
  3. Launched my lxc-convert script

Migration finished! Really easy to do it isn't it ? **Only 3 easy steps**.

To finish, [I setup cgroups configuration for my containers](https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Container_limits_.28cgroups.29). That gave me the possibility to restrict CPU, RAM, DISK I/O and SWAP usage for all my containers.

I strongly encourage you to test LXC!

In the next months/years, I think I will start looking at [Docker](https://wiki.deimos.fr/Docker_:_manage_LXC_containers_easily_with_advanced_features) (which uses LXC) in a production and will [deploy all my containers with Ansible as a module already exist](http://docs.ansible.com/docker_module.html). I do not really know yet the maturity of Docker in production but I'm sure this will be one of the most used cloud solutions with OpenStack and Ceph in the next years.
