---
title: 'LXC : how to convert a host/vm to a container'
author: Deimos
type: post
date: 2013-09-11T10:00:59+00:00
url: /2013/09/11/lxc-how-to-convert-a-hostvm-to-a-container/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - LXC
tags:
  - Debian
  - Hi-Tech
  - Linux
  - LXC

---
![Poweredbylinux](/images/Poweredbylinux.jpg)
As you can see, I write more and more posts on LXC. The latest thing I worked on, was **how to convert a host/vm to a LXC container**. I needed to write a script for it as I didn't find what I needed.

The script will remove unneeded elements in a Debian system, removing folders (dev,proc,sys), recreate devices and configure etc files. You can find more informations [by following the link](http://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Convert.2FMigrate_a_VM.2FHost_to_a_LXC_container).

I've started to convert my KVM images with it and it works perfectly :-). Do not hesitate to contact me/reply to that post if somethings wrong.