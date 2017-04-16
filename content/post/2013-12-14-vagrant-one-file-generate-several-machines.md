---
title: 'Vagrant : one file generate several machines'
author: Deimos
type: post
date: 2013-12-14T11:00:13+00:00
url: /2013/12/14/vagrant-one-file-generate-several-machines/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization

---
![Vagrant-logo](/images/logo_vagrant.png)

I'm currently playing with [Ceph][1] and wanted to generate multiple machines (6) on my laptop to perform several tests. I needed :

  * 1 public network
  * 1 private network
  * Debian wheezy OS
  * Automatically install Ceph
  * Add disk for specific machines (OSD)

It wasn't easy to make it work quickly as the documentation doesn't give a lot of examples. But what a powerful solution when it works !

If you want to try multiple VM managment, [please follow the link](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines#Example).

 [1]: http://ceph.com/ "Ceph"