---
title: 'Deb_reboot : tells you if you need to reboot your Debian'
author: Deimos
type: post
date: 2013-05-12T10:00:57+00:00
url: /2013/05/12/deb_reboot-it-tells-you-if-you-need-to-reboot-your-debian-or-not/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Developement
  - Hi-Tech
  - Linux

---
![debian_logo](/images/logo_debian.png)
It´s been a while that I was waiting for a tool that tells me if my Debian server is requesting a reboot or not. Of course GUI tools exists (like Ubuntu update-manager), but on a server machine, where there is no X server installed (thankfuly), this kind of CLI tools can be quickly interesting.

That´s why I wrote a tool called **deb_reboot** that gives the reboot requierement information in parsing postinstall scripts of installed packages.

You can find deb_tool on :

  * [My git repository](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=tools/deb_reboot)
  * [My Github account](https://github.com/deimosfr/deb_reboot)