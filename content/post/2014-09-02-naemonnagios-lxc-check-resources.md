---
title: 'Naemon/Nagios: LXC check resources'
author: Deimos
type: post
date: 2014-09-02T10:00:43+00:00
url: /2014/09/02/naemonnagios-lxc-check-resources/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
categories:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - LXC
  - Nagios
tags:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - LXC
  - Nagios

---
![Poweredbylinux](/images/Poweredbylinux.jpg)
You may know that I really like LXC and the major problem when you want to use that solution in production is: how do you monitor memory and CPU?

Regarding the CPU side, I do not have an easy answer for the moment :-(. However regarding the memory, I've made a Nagios/Naemon check which will check the memory (RAM) and SWAP of a container. Here is how to use it:

{{< highlight bash >}}Usage : check_lxc_resources -h &lt;container&gt; -n &lt;namespace&gt; -w &lt;warning%&gt; -c &lt;critical%&gt; [-d]
    -h : set container name
    -n : set container namespace to check (memory|swap)
    -w : set warning percent alert
    -c : set critical percent alert
    -d : debug mode
    -help : print this message{{< /highlight >}}

Output will looks like this for memory:

{{< highlight bash >}}memory usage is 42.95% (219M/512M) / 292M free / 177M cached{{< /highlight >}}

And like this for swap:

{{< highlight bash >}}swap usage is 0.02% (0M/464M) / 463M free{{< /highlight >}}

If you want to know more about this check or simply use it, [you can find it on my GitHub](https://github.com/deimosfr/nagios-check_lxc_resources). I hope you'll like it.
