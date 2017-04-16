---
title: 'Update 1 : Debian on the 11,1 model MacBook Pro 13'
author: Deimos
type: post
date: 2013-11-10T11:00:16+00:00
url: /2013/11/10/update-1-debian-on-the-111-model-macbook-pro-13/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Linux
  - Mac
tags:
  - Linux
  - Mac

---
![debian_logo](/images/logo_debian.png)
So this is my first update to get a full working MacBook Pro under Debian. For now, [as already talked in a last post](http://blog.deimos.fr/2013/10/27/debian-on-the-last-macbook-pro-13/), I'm trying to make every things working.

The remaining nonworking things/problems were and the resolutions I've found :

  * The iSight Camera : still not working (didn't had time to search solution neither)
  * The Speaker : should work with the latest kernel and patch ([RedHat bugzilla](https://bugzilla.kernel.org/show_bug.cgi?id=64401)) but didn't have the time to test it yet ([3.12 version available here](https://mega.co.nz/#!uop2SL6S!TeWiU1i-Oc8j1CatOmA5-BLphyFrN2PrOnQSpE6UHUM))
  * Some randoms hangs : resolved by adding [libata](http://www.kernel.org/doc/Documentation/kernel-parameters.txt) in the grub configuration (/etc/default/grub) :

{{< highlight bash >}}
GRUB_CMDLINE_LINUX_DEFAULT="quiet elevator=deadline libata.force=noncq"
{{< /highlight >}}

  * Youtube : Others video providers I've tested works well, but youtube preload, show the firsts frames and crash. Works fine with 3.11.6 kernel but not with 3.12, didn't have to investigate more yet)
  * Micro on the jack : Only the embedded micro works. I only tested it with Hangout for the moment. I thinks once I'll resolve the speaker problem, it should works as well.

If you have informations for that kind of issues, do not hesitate :-)
