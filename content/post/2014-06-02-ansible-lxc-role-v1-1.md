---
title: 'Ansible: LXC role v1.1'
author: Deimos
type: post
date: 2014-06-02T10:00:08+00:00
url: /2014/06/02/ansible-lxc-role-v1-1/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
  - LXC
tags:
  - ansible
  - debian
  - lxc

---
![ansible_logo](/images/logo_ansible.png)
I've recently updated my [LXC role for ansible](https://galaxy.ansible.com/deimosfr/lxc/). You can get it like that:

{{< highlight bash >}}ansible-galaxy install deimosfr.lxc
{{< /highlight >}}

Here is the change log:

{{< highlight bash >}}+ Adding new parameters for dnsmasq and interfaces
+ Adding new prequesite to avoid unwanted modules to load in the latest kernel versions
= Corrected networking configuration issue
= Templates do not create @LOCALSTATEDIR@ folder anymore{{< /highlight >}}

It works perfectly on my new Dedibox :-)
