---
title: LUKS and Yubikey for crypted boot
author: Deimos
type: post
date: 2013-10-29T11:00:32+00:00
url: /2013/10/29/change-luks-password/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
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
![debian_logo](/images/logo_debian.png)
I recently **crypted all my disk** as I changed laptop. At the beginning, I just tested a simple password to see performances changes.
  
I didn't really see changes for the moment.

Once I've finished to install and configure my needs, I wanted to have a **strong password solution**. I decided to use a **remembered password concatenated to a generated [yubikey](http://blog.deimos.fr/2013/07/09/yubikey-protect-your-desktop-authentication-using-pam-and-yubikey-library/) password**.

I updated [my LUKS tutorial](http://wiki.deimos.fr/Luks_:_Chiffrer_ses_partitions) to explain how to update the password.