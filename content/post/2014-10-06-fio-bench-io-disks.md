---
title: 'FIO: Bench IO disks'
author: Deimos
type: post
date: 2014-10-06T10:00:30+00:00
url: /2014/10/06/fio-bench-io-disks/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
categories:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---
![Poweredbylinux](/images/Poweredbylinux.jpg)
The first thing you generally want to do when you have any new Storage system like SSD, Disk arrays or [a Cluster Ceph](https://wiki.deimos.fr/Ceph_:_performance,_reliability_and_scalability_storage_solution), is benching. You will want to know how can read and write throughput. FIO is able to do that for you, here is an example:

{{< highlight bash >}}
[global]
ioengine=libaio
invalidate=1
ramp_time=5

direct=1
size=5G

runtime=300
time_based
directory=/home

[seq-read]
rw=read
bs=64K
stonewall

[rand-read]
rw=randread
bs=4K
stonewall

[seq-write]
rw=write
bs=64K
stonewall

[rand-write]
rw=randwrite
bs=4K
stonewall
{{< /highlight >}}

You then will have a good output of everything you need to know. More than that you can plot it:
  
![fio_graph](/images/fio_graph.jpg)

You also can look at the [nice eNovance blog post on it](http://techs.enovance.com/6110/adding-new-3rd-party-tools-in-fio).