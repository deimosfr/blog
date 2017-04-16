---
title: 'NFS: recover your client connexion when server was down'
author: Deimos
type: post
date: 2014-11-25T11:00:26+00:00
url: /2014/11/25/nfs-recover-your-client-connexion-when-server-was-down/
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
I recently had the case, where I lost connexion of my NFS client connexion because NFS server crashed. The problem I had is simple, some of clients couldn't recover their connexion because the old one was still shown as already connected.

And when I tried to remount NFS clients connexions, I got:

{{< highlight bash >}}
mount.nfs: mount(2): Protocol not supported
mount.nfs: trying text-based options 'udp,sec=sys,rsize=8192,wsize=8192,intr,hard,addr=10.0.0.1'
mount.nfs: prog 100003, trying vers=3, prot=17
mount.nfs: trying 10.0.0.1 prog 100003 vers 3 prot UDP port 2049
mount.nfs: prog 100005, trying vers=3, prot=17
mount.nfs: trying 10.0.0.1 prog 100005 vers 3 prot UDP port 54874
{{< /highlight >}}

The solution to recover was to unexport connexions from the server:

{{< highlight bash >}}
exportfs -u &lt;ip>:/mnt/nfs/dev/xmlcache&lt;/ip>
{{< /highlight >}}

If you want to know a little bit more about it, you can [check my wiki page on NFS](https://wiki.deimos.fr/NFS_:_Mise_en_place_d%27un_serveur_NFS#mount.282.29:_Protocol_not_supported). I think this kind of issue may be less present in the version 4 of the NFS protocol, but I didn't try to reproduce it with the 4 version. Any feedback will be appreciated 😉

Hope this will help