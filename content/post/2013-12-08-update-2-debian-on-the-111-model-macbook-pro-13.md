---
title: 'Update 2 : Debian on the 11,1 model MacBook Pro 13'
author: Deimos
type: post
date: 2013-12-08T11:00:09+00:00
url: /2013/12/08/update-2-debian-on-the-111-model-macbook-pro-13/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Mac
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Mac

---
![debian_logo](/images/logo_debian.png)
I think this will be the last post for the Debian installation on MacBook Pro 13' late 2013. To resume, here are the previous posts :

  * [http://blog.deimos.fr/2013/10/27/debian-on-the-last-macbook-pro-13/](http://blog.deimos.fr/2013/10/27/debian-on-the-last-macbook-pro-13/)
  * [http://blog.deimos.fr/2013/11/10/update-1-debian-on-the-111-model-macbook-pro-13/](http://blog.deimos.fr/2013/11/10/update-1-debian-on-the-111-model-macbook-pro-13/)

The majority of the bugs will be resolve in the Linux Kernel 3.13. I've tested the rc2, but it's too much unstable for the moment and I need to wait. Arch wiki gives a lot of informations to make (most of) everything working :
  
[https://wiki.archlinux.org/index.php/MacBookPro11,x](https://wiki.archlinux.org/index.php/MacBookPro11,x)

So this is my last post on this subject. I'd like to give a last tips that a colleague gave me to make the speaker work without waiting the new kernel :

{{< highlight bash >}}
sudo hda-verb /dev/snd/hwC0D0 0x1 set_gpio_data 1
{{< /highlight >}}

I hope this will help some of you who are in my case. The last remaining thing that doesn't work is the camera and there is no clue at all for today.
