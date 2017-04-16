---
title: 'LXC : Debian reported issue still not fixed'
author: Deimos
type: post
date: 2013-08-02T10:00:00+00:00
url: /2013/08/02/lxc-debian-reported-issue-still-not-fixed/
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
Hi everyone ! As you know I recently started to play with [LXC][1] :-)

At the beginning of my tests, I unfortunately found an annoying bug which avoid performing correct Debian installation over LVM.

I tried to resolve it by myself but didn't had enough time to finish my investigation. After quick searches, I found that other people found the bug on github : <https://github.com/simonvanderveldt/lxc-debian-wheezy-template/issues/1#issuecomment-21303483>

As a rule, I searched it on Debian bugs list but nothing was reported. I opened a new bug to report this one and gived my investigation on it with the reproducing method. You can check how fast my problem was closed without any constructive reasons : <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=716839>

More than that, the fix was given by Robert Brockway but the bug was closed and set as fixed by Daniel Baumann (core maintainer of LXC package) without being applyed and resolved !

I still don't understand how it is possible to have such maintainers in a so big project (Debian). My question is : how do we do to make those kind of guys understand that they need to talk more with community and stop being so narrow.

This is a tiny fix that correct an LXC deployment method available in Debian Wheezy (current stable). We give the fix to correct a problem of an already existing functionality and it is refused because the maintainer said : "choose another method". WTF ?

I'll try to talk to other Debian's members to get a help on resolution of that ticket. But what a wasting time !

Other related informations : [https://github.com/simonvanderveldt/lxc-debian-wheezy-template](https://github.com/simonvanderveldt/lxc-debian-wheezy-template)

 [1]: http://blog.deimos.fr/2013/07/17/lxc-basic-installation-and-usage/ "LXC : basic installation and usage"