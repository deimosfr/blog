---
author: Deimos
type: post
url: /2018/11/19/restore-edgerouter-usb-drive/
categories:
  - linux
  - network
  - ubiquiti
  - edgerouter
date: 2018-11-19T00:00:00+02:00
tags:
  - linux
  - network
  - ubiquiti
  - edgerouter
image: /images/logo_ubiquiti.png
thumbnailImage: /thumbnails/logo_ubiquiti.png
thumbnailImagePosition: left
title: Restore EdgeRouter USB drive
url: /2018/11/19/restore-edgerouter-usb-drive/

---

![Ubiquiti](/images/ubiquiti_big_logo.png)

I've a [Ubiquiti EdgeRouter PoE][1] since several years now and really like it. Fanless, small, running on Debian (unfortunately not really up to date) and powerful.

However I recently had issues with the disk. Simply dead and obviously a reboot didn't repaired it. I've been searching solutions on the official forum to replace the disk and I was surprised about the fact it runs on a simple USB stick. I decided to replace it with a [Kingston one][2]:

![EdgeRouter photo](/images/edgerouter_poe_open.jpg)

That was really simple to open and change the USB stick. However I had to reinstall the OS (EdgeMax) of course. On the forum I mostly found solutions based on DHCP/PXE/TFTP, which is hopefully not the fastest solution to recover it.

Finaly I found a GitHub project (thanks to the creator) called [mkeosimg][3] that build an img file containing the OS. However there is a small bug and I [forked the project][4] for the moment to fix the issue. To create the image, I had to download the latest version of the firmware and launch the script:

```bash
$ git clone https://github.com/deimosfr/mkeosimg
$ cd mkeosimg
$ wget https://dl.ubnt.com/firmwares/edgemax/v1.10.x/ER-e100.v1.10.7.5127970.tar
$ sudo ./mkeosimg ER-e100.v1.10.7.5127970.tar
umount: /mnt/boot: not mounted.
umount: /mnt/root: not mounted.
Creating ER-e100.v1.10.7.5127970.img
2048+0 records in
2048+0 records out
2147483648 bytes (2.1 GB, 2.0 GiB) copied, 3.93915 s, 545 MB/s
Formatting ER-e100.v1.10.7.5127970.img
mkfs.fat 4.1 (2017-01-24)
Unpacking EdgeOS release image
Verifying EdgeOS kernel
Copying EdgeOS kernel to boot partition
Verifying EdgeOS system image
Copying EdgeOS system image to root partition
Copying version file to the root partition
Creating EdgeOS writable data directories
Done.
```

Now copy the image to the USB stick:

```bash
$ sudo dd if=./ER-e100.v1.10.7.5127970.img of=/dev/sdb bs=1M
```

Once done, I mounted the 2nd partition and restored my scripts, keys and backups (config.boot file) to it. I plugged back to the EdgeRouter the key. It booted with my previous configuration :).

Really fast and easy !

 [1]: https://www.ubnt.com/edgemax/edgerouter-poe/
 [2]: https://www.amazon.fr/gp/product/B006YBARCA
 [3]: https://github.com/sowbug/mkeosimg
 [4]: https://github.com/deimosfr/mkeosimg
