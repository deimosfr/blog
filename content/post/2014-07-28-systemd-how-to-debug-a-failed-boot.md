---
title: 'Systemd: how to debug a failed boot'
author: Deimos
type: post
date: 2014-07-28T10:00:46+00:00
url: /2014/07/28/systemd-how-to-debug-a-failed-boot/
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
I recently switched my laptop from InitV to Systemd. And things didn't happened as expected. That's why I need to deep dive into Systemd issues and understand why it wasn't working. I got problems like this:

{{< highlight bash >}}
Failed to get D-Bus connection: No connection to service manager.
{{< /highlight >}}

And hopefully I found very good documentations on Internet (and especially on Arch wiki). I've made [a summary on my wiki](https://wiki.deimos.fr/Systemd:_how_to_debug_on_boot_fail) if you want to know how to diagnose a Systemd issue.
