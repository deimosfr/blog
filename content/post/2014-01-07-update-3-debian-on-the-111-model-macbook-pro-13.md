---
title: 'Update 3 : Debian on the 11,1 model MacBook Pro 13'
author: Deimos
type: post
date: 2014-01-07T11:00:00+00:00
url: /2014/01/07/update-3-debian-on-the-111-model-macbook-pro-13/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Others
tags:
  - Others

---
![debian_logo](/images/logo_debian.png)
To resume, here are the previous posts :

  * [http://blog.deimos.fr/2013/10/27/debian-on-the-last-macbook-pro-13/](http://blog.deimos.fr/2013/10/27/debian-on-the-last-macbook-pro-13/)
  * [http://blog.deimos.fr/2013/11/10/update-1-debian-on-the-111-model-macbook-pro-13/](http://blog.deimos.fr/2013/11/10/update-1-debian-on-the-111-model-macbook-pro-13/)
  * [http://blog.deimos.fr/2013/12/08/update-2-debian-on-the-111-model-macbook-pro-13/](http://blog.deimos.fr/2013/12/08/update-2-debian-on-the-111-model-macbook-pro-13/)

The last week end, I've resolved flash problems which were not in fact due to flash as I thought but to the Alsa driver. It wasn't charging the proper the drivers in the correct order. That's why MID card was used before PCH. So I wasn't able to listen anything and that's why Youtube videos didn't worked.

First of all, look at the correct order of your sound card :

{{< highlight bash >}}
$ cat /proc/asound/cards                
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xb0a14000 irq 69
 1 [MID            ]: HDA-Intel - HDA Intel MID
                      HDA Intel MID at 0xb0a10000 irq 68
{{< /highlight >}}

Here it's correct as index 0 is my PCH card and 1 is my MID (but it was inverted). To correct it, I've updated line in /etc/modprobe.d/alsa-base.conf to :

{{< highlight bash >}}
options snd-hda-intel model=mbp101 index=1
{{< /highlight >}}

Then rebooted and now it's ok :-). I hope this will help you too. The remaining things are disabling S/PDIF (should be corrected in 3.13 kernel) and the webcam (no news :-().
