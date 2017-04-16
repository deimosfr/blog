---
title: 'LXC : Some little setbacks'
author: Deimos
type: post
date: 2013-08-28T10:00:00+00:00
url: /2013/08/28/some-little-setbacks-with-lxc/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
  - -1.2289942
  - -1.2289942
  - -1.2289942
  - -1.2289942
  - -1.2289942
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
As I'm new to LXC, I am discovering how it works, see the maturity of the project and it's integration in Debian. I've made a post a few weeks ago to [introduce the basics](http://blog.deimos.fr/2013/07/17/lxc-basic-installation-and-usage/) and now I'm digging in advanced features.
  
I've encountered several issues. Most of them are not critical but unfortunately looks like a lack of integration on Debian.

  * The first one is related to wheezy template and I've already talked about it [in a previous post](http://blog.deimos.fr/2013/08/02/lxc-debian-reported-issue-still-not-fixed/).
  * Another one is when you want to limit your container memory. You need to enable it from the kernel. I once again wasted time [to find the solution](http://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Can.27t_limit_container_memory).
  * And this is the same problem for limiting swap, [the solution is here](http://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#SWAP).
  * The last one is for limiting disk bandwidth. The solution is [to upgrade Debian kernel](http://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Disk_bandwidth).

I think this won't be the last issue I'll see. For the moment what I can say is LXC is really sexy, fast and it's complete integration is the kernel mainstream is a big advantage !