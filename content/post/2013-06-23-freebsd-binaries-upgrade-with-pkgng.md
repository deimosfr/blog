---
title: FreeBSD binaries upgrade with pkgng
author: Deimos
type: post
date: 2013-06-23T10:00:04+00:00
url: /2013/06/23/freebsd-binaries-upgrade-with-pkgng/
image: /images/logo_freebsd.png
thumbnailImage: /thumbnails/logo_freebsd.png
thumbnailImagePosition: left
categories:
  - FreeBSD
  - Hi-Tech
tags:
  - FreeBSD
  - Hi-Tech

---
![Poweredbyfreebsd](/images/logo_freebsd.png)
I've recently played with pkgin under NetBSD and searched to make it work under FreeBSD. Anyway it's not really compatible. I saw old unmaintained version, but no one worked for me as expected :-(.

After a few searches, I found pkg2ng :-). That's THE tool for FreeBSD. But unfortunately, as [written in the wiki](https://wiki.freebsd.org/pkgng) :

> As a consequence of the security incident on 11th November 2012, for the time being pre-compiled packages for pkgng are not available from any official FreeBSD repository. The test repository pkgbeta.freebsd.org contains only a copy of pkg-1.0.X.txz in order to facilitate the bootstrap procedure for enabling pkgng on a new system. Availability of the new official pkg build cluster has been set back, as resources have instead been devoted to cleaning up after the compromise, and the distributed package building software is being heavily revised for improved security. 

The solution to make it work is to change the default URL to [Exonetric.net mirror](http://mirror.exonetric.net/), it works like a charm :-)

If you want to get the procedure on how to set it up, [I've wrote a little tutorial](https://wiki.deimos.fr/Le_syst%C3%A8me_de_Packages_FreeBSD#Nouvelle_m.C3.A9thode) (in french).