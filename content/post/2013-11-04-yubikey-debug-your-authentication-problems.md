---
title: 'Yubikey : debug your authentication problems'
author: Deimos
type: post
date: 2013-11-04T11:00:44+00:00
url: /2013/11/04/yubikey-debug-your-authentication-problems/
image: https://wiki.deimos.fr/images/0/01/Yubikey.png
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![Yubikey](https://wiki.deimos.fr/images/0/01/Yubikey.png)

Since I've reinstalled my desktop on my new MacBook Pro 13, I had to fight with some problems with my Yubikey. I never had such and wonder if it couldn't comes from a Debian package update.

Anyway, I had problem with permissions on the USB device and found a udev solution. [I've updated my documentation](https://wiki.deimos.fr/Yubikey_:_Configure_your_yubikey_with_pam) and let you check and would like a feedback if some of you have encountered the same issue (USB error: Access denied (insufficient permissions))

Hope this will help some of you !