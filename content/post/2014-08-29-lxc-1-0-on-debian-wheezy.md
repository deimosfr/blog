---
title: LXC 1.0 on Debian Wheezy
author: Deimos
type: post
date: 2014-08-29T10:00:52+00:00
url: /2014/08/29/lxc-1-0-on-debian-wheezy/
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
I'm using for my own servers LXC for about a year now. I'm still fed up about bugs introduced by the beta version of LXC (0.8b) present in Debian Wheezy. As now **LXC project has released a stable version**, I've looked at the Debian backports, but didn't have any chance to find a newer version on it :-(. However, **a version 1.0.4 exist on Debian Jessie**. I took the Debian sources and recompiled them on Wheezy ([available here](/static/archives/lxc_1.0.4.tgz)).

So if you want to update from 0.8b to the 1.0.4 version, it's easy, but you need to take care about changes between both versions. For example, automatic boot feature, which involves to make some changes in your current configuration to work properly. lxc-shutdown command doesn't exist anymore, lxc-stop replace it for a graceful shutdown and have an optional argument if you want to force all process' containers to switch off. Another good news is: **the default wheezy template works like a charm out of the box 😀**

**Note: before going ahead, it's better if you can switch off your containers as they won't be seen anymore by lxc-list after upgrading until reboot. May be there is a solution to avoid it, but didn't had the time to search it.**

To install it with the required dependencies:

{{< highlight bash >}}cd /tmp
wget http://blog.deimos.fr/wp-content/uploads/2014/08/lxc_1.0.4.tgz
tar -xzf lxc_1.0.4.tgz
dpkg -i lxc_1.0.4-3_amd64.deb lxc-stuff_1.0.4-3_all.deb
apt-get -f install
{{< /highlight >}}

Now, you need to change your LXC configuration if you want them to automatically start at boot. Edit config file of each containers and add this line (eg. /var/lib/lxc/container/config):

{{< highlight bash >}}lxc.start.auto = 1
{{< /highlight >}}

You now have to reboot to validate new configuration. That's it.

* * *

&nbsp;

If you want to know, how I've made the packages, here is the procedure:
  
1. First, temporary insert the Jessie sources in your sources.list and add wheezy backports:

{{< highlight bash >}}# Jessie
deb http://ftp.fr.debian.org/debian/ jessie main non-free contrib
deb-src http://ftp.fr.debian.org/debian/ jessie main non-free contrib
# Wheezy backports
deb http://ftp.fr.debian.org/debian/ wheezy-backports main{{< /highlight >}}

2. Get the sources:

{{< highlight bash >}}apt-get update
mkdir /tmp/lxc
cd !$
apt-get source lxc
{{< /highlight >}}

3. Remove previously added jessie sources and apt-get update once again.
  
4. Install dependencies:

{{< highlight bash >}}apt-get install build-essential fakeroot dpkg-dev dh-autoreconf doxygen docbook2x graphviz libapparmor-dev liblua5.2-dev libseccomp-dev libselinux-dev pkg-config python3-dev dh-systemd libcap-dev{{< /highlight >}}

5. Finally make new packages:

{{< highlight bash >}}dpkg-buildpackage -rfakeroot -b
{{< /highlight >}}

.deb packages are now available. I hope that help you. I would like to send it to Debian backport team, but never did it in the past and unfortunately don't have much time to spend in it for the moment. So if someone familiar have the time to do it, it will be a pleasure.

&nbsp;

Update 16/01/2015: I updated this docuementation for the latest Jessie version (1.0.6-6)
