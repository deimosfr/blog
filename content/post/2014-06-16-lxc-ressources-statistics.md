---
title: 'LXC: ressources statistics'
author: Deimos
type: post
date: 2014-06-16T10:00:00+00:00
url: /2014/06/16/lxc-ressources-statistics/
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
I wanted to find a way to properly view resources (memory/CPU/IO) usages or configuration. For that I need to use [cgroups][1]. But the problem are on free, top, htop or common any tools, as they do not get the real informations of the container.

We're in fact waiting on a lot of work on the kernel side or systemd side. More information's [can be found here](http://fabiokung.com/2014/03/13/memory-inside-linux-containers/). Another solution that permit to bind a socks inside containers exists called [CGManager](https://lwn.net/Articles/575683/), however classical tools doesn't use it to get informations.

In waiting a real solution, I wrote all little script that give information's regarding the container resources. It's quick and dirty but make the job:

{{< highlight bash >}}===== mycontainer =====
CPU, cap:                3-4,6-7
CPU, shares:             1024
RAM, limit usage:        2048M
RAM+SWAP, limit usage:   3072M
RAM, current usage:      1577.33M
RAM+SWAP, current usage: 1582.79M
RAM, max usage:          2048M
RAM+SWAP, max usage:     2060.5M
DISK I/O weight:         500
{{< /highlight >}}

Regarding the code, here it is...simply read the cgroups information:

{{< highlight bash >}}#!/bin/bash

cd /sys/fs/cgroup/lxc/
for i in * ; do
    if [ -d $i ] ; then
        echo "===== $i ====="
        echo "CPU, cap:               " $(cat /sys/fs/cgroup/lxc/$i/cpuset.cpus)
        echo "CPU, shares:            " $(cat /sys/fs/cgroup/lxc/$i/cpu.shares)
        awk '{ printf "RAM, limit usage:        %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.limit_in_bytes
        awk '{ printf "RAM+SWAP, limit usage:   %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.memsw.limit_in_bytes
        awk '{ printf "RAM, current usage:      %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.usage_in_bytes
        awk '{ printf "RAM+SWAP, current usage: %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.memsw.usage_in_bytes
        awk '{ printf "RAM, max usage:          %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.max_usage_in_bytes
        awk '{ printf "RAM+SWAP, max usage:     %sM\n", $1/ 1024/1024 }' /sys/fs/cgroup/lxc/$i/memory.memsw.max_usage_in_bytes
        echo "DISK I/O weight:        " $(cat /sys/fs/cgroup/lxc/$i/blkio.weight)
        echo ""
    fi  
done{{< /highlight >}}

Hope this help some of you who didn't know where to look at.

 [1]: https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers#Container_limits_.28cgroups.29 "cgroups "
