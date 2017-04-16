---
title: 'Yubikey : protect your desktop authentication using pam and yubikey library'
author: Deimos
type: post
date: 2013-07-09T10:00:00+00:00
url: /2013/07/09/yubikey-protect-your-desktop-authentication-using-pam-and-yubikey-library/
image: https://wiki.deimos.fr/images/0/01/Yubikey.png
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Security
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Security

---
![Yubikey](https://wiki.deimos.fr/images/0/01/Yubikey.png)

I've bought [2 Yubikeys](http://www.yubico.com/) several months ago and didn't really took the time to play with them.

A ex-colleague took that time and configured it on his desktop under ArchLinux. I decided to play with it, see how could it works and with his help, put it in place in a very short time.

I configured it to work in parallel of my password. With that configuration, I do not need anymore typing my password, but only need to plug in my Yubikey. If I loose it, I can enter the password instead.
  
And if I remove it, it automatically launch my screensaver with locking feature.

Pretty cool no ? If you do not have a Yubikey, you can [order one there](http://www.yubico.com/). If you have one and want to see how I configured it, [follow the link](http://wiki.deimos.fr/Yubikey_:_Configure_your_yubikey_with_pam).