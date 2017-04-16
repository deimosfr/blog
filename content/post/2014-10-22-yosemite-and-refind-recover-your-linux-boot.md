---
title: 'Yosemite and Refind: recover your Linux boot'
author: Deimos
type: post
date: 2014-10-22T10:00:00+00:00
url: /2014/10/22/yosemite-and-refind-recover-your-linux-boot/
image: /images/logo_osx.png
thumbnailImage: /thumbnails/logo_osx.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Red Hat

---
![OS_X-Logo](/images/logo_osx.png)
You may upgrade your Mac OS X version to Yosemite (10.10) and saw you dual boot with Linux not working anymore :-(.

That's because Apple made changes and Refind is not yet ready for it. So here is the solution to get your dual boot half back. It won't fully work as expected, but you'll be able to boot to Linux with Refind and Mac OS X with the alt key. First grab the latest version of [Refind here](http://sourceforge.net/projects/refind/), then:

{{< highlight bash >}}
cd Downloads/
unzip refind-bin-0.8.3.zip
cd refind-bin-0.8.3
sudo diskutil unmount /Volumes/ESP/
sudo ./install.sh --esp
sudo mkdir /Volumes/esp
sudo mount -t msdos /dev/disk0s1 /Volumes/esp
sudo cp -Rfp refind/drivers_x64 /EFI/boot/drivers
cd /Volumes/esp/EFI/
sudo mv refind boot
sudo cp -Rf /EFI/boot/drivers .
sudo cp -Rf /EFI/boot/drivers refind
cd refind
sudo mv refind_x64.efi bootx64.efi
cd /EFI
sudo mv refind boot
sudo cp -Rf /EFI/boot/drivers .
sudo cp -Rf /EFI/boot/drivers refind
cd refind
sudo mv refind_x64.efi bootx64.efi

{{< /highlight >}}

Then edit the refind.conf file and adapt those line/uncomment them:

{{< highlight bash >}}
scan_driver_dirs EFI/boot/drivers
scan_delay 1
dont_scan_files shim.efi,MokManager.efi

{{< /highlight >}}

Now you can reboot, you'll be able to boot your Linux system. This can take a while for unknow reasons :-(. We're waiting a newer version of Refind to make it working as it should...

Here is the [source](http://forums.macrumors.com/showthread.php?t=1740614) where I found the solution.

UPDATE: To get all working see: [http://www.rodsbooks.com/refind/yosemite.html](http://www.rodsbooks.com/refind/yosemite.html)