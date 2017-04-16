---
title: 'LXC : use dnsmasq instead of libvirt'
author: Deimos
type: post
date: 2013-11-28T11:00:05+00:00
url: /2013/11/28/lxc-use-dnsmasq-instead-of-libvirt/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![Poweredbylinux](/images/Poweredbylinux.jpg)
LXC is a really good container solution to replace older container solutions like [OpenVZ](https://wiki.deimos.fr/OpenVZ_:_Mise_en_place_d%27OpenVZ) or [Vserver](https://wiki.deimos.fr/VServer_:_Mise_en_place_de_VServer) for instance. [Libvirt](http://libvirt.org/) is a wonderful tool to manage different hypervisors and containers solutions. Anyway Libvirt is unfortunately not able to fully manage LXC (create, delete...) today.
  
That's why it's not necessary to get it running and installed on a server, but it could be useful if you have KVM and LXC working on the same machine to get the same tool to handle start/stop containers/VMs.

So I've added to [my documentation the dnsmasq](https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Nat_configuration) configuration to avoid Libvirt usage.