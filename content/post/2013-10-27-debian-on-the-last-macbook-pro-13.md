---
title: Debian on the 11,1 model MacBook Pro 13
author: Deimos
type: post
date: 2013-10-27T11:00:06+00:00
url: /2013/10/27/debian-on-the-last-macbook-pro-13/
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
I tested to install Debian as I love it more than Mac OS X for work on my new MacBook Pro 13 retina. Most of the hardware works out of the box on a Debian Jessie (because of the **kernel version > 3.8**) but is not really optimal. That's why I'm going to explain how I did to make it better.

First of all, you need an EFI manager. I discovered that **[Refit](http://refit.sourceforge.net/) is not maintained anymore and let place to [rEFInd](http://www.rodsbooks.com/refind/) instead**. So you need to download and install it. Then you'll be able to see the manager at first reboot. rEFInd will be able to boot from Debian installer on USB key for instance in EFI mode (in fact you don't really need this manager now, but it's better to have it now to manage you future dual boot).

I needed to use a recent kernel (that's why I recommend Jessie) and have to add the **broadcom wifi drivers** to make it work. I followed those instructions on the [official Debian wiki](https://wiki.debian.org/wl) and it worked.

Do not forget to look at **powertop** recommendations to optimize your battery life. You also need to [activate TRIM](http://wiki.deimos.fr/Optimiser_les_performances_des_disques_dur_sur_Linux#Optimisations_pour_les_SSDs) to keep as longer as possible your SSD..

I needed to install **acpi-support** to get "on lid close" sleep feature.

I also needed to have **keyboard backlight** functionality as pommed software does not recognize this Mac version (11,1) yet. So I had to do tricks on /sys and apply them in my Awesome configuration (rc.lua). You can find it as usual [on my git](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/awesome).

After several hours working with Debian on the MacBook Pro, **I discovered several issues** : sound problems, iSight (webcam) not functional, Adobe flash issues, some sec freeze for unknow reasons. I decided to try to **compil the latest kernel version** and package it for Debian to see if it resolves issues. **This corrected nearly all my problems** instead of the iSight. If you want to [download the 3.11.6 kernel for Debian, follow the link](https://mega.co.nz/#!ulgwhASC!OfGNsyRoaIcnX4hi0rSyH1BUo9hA-nVBWor_r9YfGnY).

My 2 remaining problems are the webcam and speaker. I'm still investigating and will keep you up to date on that.

Now I'm really happy to have the best hardware compromise that exist today with the best operating system !