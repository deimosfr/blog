---
title: Debian Jessie and MacBookPro 13 (2015/12,1) with Kernel 4
author: Deimos
type: post
date: 2015-04-28T10:00:45+00:00
url: /2015/04/28/debian-jessie-and-macbookpro-13-2015121-with-kernel-4/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 3
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
I recently had the chance to get the latest MacBookPro 13 for my new work at Criteo. If you follow me and remember, [this is not the first time](https://blog.deimos.fr/2014/01/07/update-3-debian-on-the-111-model-macbook-pro-13/) I want to use Debian on a new MacBookPro version.

## Overview

History repeats itself and as you can think, some things are not working out of the box on Debian Jessie. Here are the issues I encountered and how i could fix some of them:

  * Wifi: not supported on 3.16 kernel version. Need the 3.19 at least. **Fixed**
  * Fn keyboard key: this key is not recognized by the kernel. **Fixed**
  * Sound: sound is not working because of the boot sequence. **Fixed**
  * SSD lockups: I encountered a freeze like on the previous mac du to SSD. **Fixed**
  * Screen backlight: xbacklight doesn't work. **Fixed with a workaround**
  * Video drivers: some slowdown due to missing video driver. **Fixed**
  * Keyboard inversed keys: the '@' and '<>' are inversed. **To fix**
  * Trackpad: no right click because of the new mechanism. **To fix**
  * Webcam: no chance to work now as no drivers exists :-(

Now you've got an overview. Let's take each point to see how you can fix the one I could resolve.

## Wifi

The wifi broadcom chipset is unfortunately not working out of the box [(source)](http://ubuntuforums.org/showthread.php?t=2274110). For this you need a kernel version at least equal to 3.19. As the Linux Kernel 4 is out, I recompiled a kernel with this version and added the wifi support in it. Here is the procedure:

{{< highlight bash >}}
wget https://blog.deimos.fr/wp-content/uploads/2015/04/linux-image-4.0.0_4.0_amd64.deb_.tgz
tar -xzf linux-image-4.0.0_4.0_amd64.deb_.tgz
sudo dpkg -i linux-image-4.0.0_4.0_amd64.deb
sudo wget -O /lib/firmware/brcm/brcmfmac43602-pcie.bin https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43602-pcie.bin
{{< /highlight >}}

Reboot and boot to the new kernel, it works :-)

## Fn keyboard key

Following this [thread](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1443370), the Fn key doesn't work at all because not recognized by the kernel. I included the patch in the kernel as well. So you can use the same procedure than above to install the kernel.

Also, here is another interesting [link](https://github.com/SicVolo/hid-apple-3.19).

## Sound

Regarding the sound, it's like for the previous MacBookPro, you need to adjust some module parameters:

{{< highlight bash >}}
$ cat /etc/modprobe.d/alsa.conf
# alsa fix
options snd-hda-intel model=mbp101 index=1
# Keep snd-pcsp from beeing loaded as first soundcard
options snd-pcsp index=-2
{{< /highlight >}}

&nbsp;

## SSD lockups

Here is the line I've got in /etc/default/grub to resolve the problem:

{{< highlight bash >}}
GRUB_CMDLINE_LINUX_DEFAULT="quiet libata.force=noncq rootflags=data=writeback"
{{< /highlight >}}

## Screen backlight

I used a script for the previous Mac (11,1) but needed to update it to make it work properly. Here is the updated version:

{{< highlight bash >}}
#!/bin/bash

if [ $UID -ne 0 ]; then
    echo "Please run this program as superuser"
    exit 1
fi

GMDIR=/sys/class/backlight/acpi_video0
BLDIR=/sys/class/backlight/intel_backlight
if [[ ! -d $BLDIR ]]; then
    if [[ -d $GMDIR ]]; then
        BLDIR=$GMDIR
    else
        echo "Check what directory your backlight is stored in /sys/class/backlight/"
        exit 1
    fi
fi

BLFILE="$BLDIR/brightness"
BACKLIGHT=$(cat $BLFILE)
INCREMENT=50
SET_VALUE=0
MAX=$(cat "$BLDIR/max_brightness")

case $1 in

    up)
        TOTAL=`expr $BACKLIGHT + $INCREMENT`
        if [ $TOTAL -gt "$MAX" ]; then
            exit 1
        fi
        SET_VALUE=1
        ;;
    down)
        TOTAL=`expr $BACKLIGHT - $INCREMENT`
        if [ $TOTAL -lt "0" ]; then
            exit 1
        fi
        SET_VALUE=1
        ;;
    total)
	TEMP_VALUE=$BACKLIGHT
	while [ $TEMP_VALUE -lt "$MAX" ]; do
		TEMP_VALUE=`expr $TEMP_VALUE + 1`
		if [ $TEMP_VALUE -gt "$MAX" ]; then TEMP_VALUE=$MAX; fi
		echo $TEMP_VALUE &gt; $BLFILE
	done
        ;;
    off)
	TEMP_VALUE=$BACKLIGHT
	while [ $TEMP_VALUE -gt "0" ]; do
		TEMP_VALUE=`expr $TEMP_VALUE - 1`
		if [ $TEMP_VALUE -lt "0" ]; then TEMP_VALUE=0; fi
		echo $TEMP_VALUE &gt; $BLFILE
	done
        ;;
    *)
        echo "Use: screen-backlight up|down|total|off"
        ;;
esac

if [ $SET_VALUE -eq "1" ]; then
    echo $TOTAL &gt; $BLFILE
fi

{{< /highlight >}}

As I'm using i3 wm, I added those lines in my configuration to make keyboard bindings:

{{< highlight bash >}}
bindcode 233 exec --no-startup-id "sudo screen-backlight up"
bindcode 232 exec --no-startup-id "sudo screen-backlight down"
{{< /highlight >}}

As you can see, some sudo commands are required, so I've created a file in /etc/sudoers.d with this content:

{{< highlight bash >}}
Cmnd_Alias SCREENBACKLIGHT = /usr/bin/screen-backlight
%deimos ALL = (ALL) NOPASSWD: SCREENBACKLIGHT
{{< /highlight >}}

## Video driver

You can get working video drivers by installing experimental version of xorg intel package. You need to get experimental repository in your sources.list, then upgrade the package:

{{< highlight bash >}}
apt-get install -t experimental xserver-xorg-video-intel
{{< /highlight >}}

## Conclusion

I have some work to do to make all the things work and wait for some drivers to be released. Debian Jessie is now out and I'll switch to the next testing branch. This will permit to avoid doing so manual stuffs like kernel recompilation.

If you encounter other issues, you should also take a look at Arch Linux wiki on the previous MacBookPro version as a lot of things corresponding to this new MacBooPro version as well: [https://wiki.archlinux.org/index.php/MacBookPro11,x](https://wiki.archlinux.org/index.php/MacBookPro11,x)
