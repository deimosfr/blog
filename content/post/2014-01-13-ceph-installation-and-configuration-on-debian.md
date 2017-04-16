---
title: 'Ceph: setup Monitors nodes (mon) on Debian'
author: Deimos
type: post
date: 2014-01-13T11:00:12+00:00
url: /2014/01/13/ceph-installation-and-configuration-on-debian/
image: /images/logo_ceph.png
thumbnailImage: /thumbnails/logo_ceph.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux

---
![ceph_logo](/images/logo_ceph.png)
I finally started to play with Ceph to **add it in production**. I'm still impressed by this storage solution. Just to remind, [Ceph](http://ceph.com/) **is an open-source, massively scalable, software-defined storage system** which provides **object**, **block** and **file system storage** (not yet ready for production usage) in a single platform. It runs on commodity hardware-saving you costs, giving you flexibility. And as it’s in the Linux kernel, it’s easy to consume.

I'm using Ceph to :

  * Store a huge amount of data
  * Get it resilient
  * The ability to grow fast and quickly
  * Using different storage mechanisms with a single technology !

Be sure this is one of storage mechanism of the future as it's really powerful !

As the official documentation is not enough concise in my opinion and not fully finished, I've made a documentation to install it quickly. I can't give all the informations regarding how the solution works because it would be too long and the official documentation is really good on that point. **This is the first of three posts on it.**

So if you want to test Ceph, [take a look at my documentation](https://wiki.deimos.fr/Ceph_:_performance,_reliability_and_scalability_storage_solution). I've also attached a [Vagrant](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines) configuration to help you on **quickly setup environments for testing purposes**.