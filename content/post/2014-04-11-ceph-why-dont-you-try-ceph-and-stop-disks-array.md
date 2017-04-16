---
title: 'Ceph: why don’t you try Ceph and stop disks array?'
author: Deimos
type: post
date: 2014-04-11T10:00:00+00:00
url: /2014/04/11/ceph-why-dont-you-try-ceph-and-stop-disks-array/
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

In France, we have the chance to have an ISP/Mobile Telephony provider called [Free](http://www.free.fr). They considerably reduced the market price for the Mobile phone communications in 2012. This was very fine for competition and for French people. Now we can have correct prices for Internet and cell phone data. Thanks to [Free](http://mobile.free.fr/).

[Ceph](http://ceph.com/) is quite the same as Free but for storage systems. Since many years, **disks array constructors sold us locked solutions with a very high cost of hardware and licenses' software**. The time has come to **stop this swindle** and to look around us. Data storage is more and more necessary in now days, we need to have more, faster, scalable and efficient storage. **Today Ceph is answering all at free of cost !**

**No need to buy disks arrays anymore!** With Ceph you can do

  * **Block storage** (mount classical drives as block on a single node)
  * **Object storage** (like AWS S3)
  * **Distributed filesystem** (not yet ready for production but should be in the year)

Try to calculate the cost of Terra-bytes (or more) on disks arrays vs servers with Ceph. Try also to understand the nightmare it could be to grow your disks array with several array extensions and think about a simple scalable solution. That's what Ceph provides! **Easy to add OSD, no need to think about raid failure anymore, no hardware lock-in...**

What about your old disks arrays? You can do crap with frontal servers (**providing NFS, SMB, iSCSI... or any free and standard solutions**) and add disks arrays as OSD in Ceph. Last option...let them die (little bit kidding).

It is rare that I spit in someone's face, but disks array constructors (sorry guys) abused too much in my opinion, during so many years. In addition, I got so many similar discussions in the last weeks that I needed to make a blog post for it.

As a reminder, **if you want to try Ceph, you can look at [my wiki](https://wiki.deimos.fr/Ceph_:_performance,_reliability_and_scalability_storage_solution) or [the official documentation](http://ceph.com/docs/master/).**