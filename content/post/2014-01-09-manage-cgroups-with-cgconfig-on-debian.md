---
title: Manage cgroups with cgconfig on Debian
author: Deimos
type: post
date: 2014-01-09T11:00:09+00:00
url: /2014/01/09/manage-cgroups-with-cgconfig-on-debian/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
rating:
  - 4
votes:
  - 1
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
Cgroups permit to restrict a process to specific hardware like CPU or limiting IO disk etc... Managing it manually could be a nightmare and hopefully, a good workaround exists.

It's called cgconfig and allows you to have a running daemon to apply restrictions on all new running process. I've made a [documentation for it](https://wiki.deimos.fr/Latence_des_process_et_kernel_timing#Cgroups_with_cgconfig) and spent time on it as it's not properly Debian packaged yet :-(