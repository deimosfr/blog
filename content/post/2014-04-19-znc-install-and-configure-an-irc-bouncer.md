---
title: 'ZNC: install and configure an IRC bouncer'
author: Deimos
type: post
date: 2014-04-19T10:00:12+00:00
url: /2014/04/19/znc-install-and-configure-an-irc-bouncer/
image: /images/logo_znc.png
thumbnailImage: /thumbnails/logo_znc.png
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
![Znc](/images/logo_znc.png)
I recently needed to install an IRC bouncer as I was fed up to launch every say a ssh to connect to an external server, on which I had a tmux running a weechat to get IRC history. 2 problems here:

  * Sometimes, I forgot to connect on it and missed some messages
  * It was not integrated to Pidgin (what I use for any IM protocol)

So I decided to setup a bounce IRC with ZNC!

Here is my documentation on how to quickly [setup ZNC](https://wiki.deimos.fr/ZNC:_use_a_bouncer_to_get_history).