---
author: Deimos
type: post
url: /2020/03/29/arch-linux-install-with-uefi-and-encrypted-disk/
categories:
  - linux
  - arch
date: 2020-03-29T00:00:00+02:00
tags:
  - linux
  - arch
image: /images/logo_arch.png
thumbnailImage: /thumbnails/logo_arch.png
thumbnailImagePosition: left
title: Arch Linux install with UEFI and encrypted disk
url: /2020/03/29/arch-linux-install-with-uefi-and-encrypted-disk/

---

![Name_logo](/images/logo_arch.png)

Several times I had to install [Arch Linux][1] those 8 past years. Not because it's not stable but because I changed hardware. Any time it was a pain to remind me how to do stuff during the [install process][2]. I really love this Linux distribution, but I have to admit the install process is far complex that what we found on other distribution.

I never did a how to and once again I wasted my time on reading the doc etc...but I just wanted to go fast. So I'm pasting here my configuration for people like me who wants to go fast or for me for future installs.

# Boot form USB

Take a USB key or external drive, download the ISO image from [Arch website][1] and make it bootable (with root user):

```bash
dd if=archlinux.img of=/dev/sdX bs=16M && sync
```

# Bios configuration

Ensure you've got secure boot disabled and boot on the usb key.

# Keyboard setup

I'm french and familiar with french keyboards:

```bash
loadkeys fr-latin9
```

# Setup network

Connect to the wifi:

```bash
device list
```

You should get the name of your network interface like `wlan0`.

Now, run a scan, look at the wished network name and connect to it:

```
station wlan0 scan
station wlan0 get-networks
station wlan0 connect <SSID wifi name>
```

If there is a secret, you should be prompted for it. You can then validate with:

```
station wlan0 show
```


# Configure NTP

Setup time with NTP:
```bash
timedatectl set-ntp true
```

# Create partitions

I needed to have:
* `/boot`: as my EFI boot partition
* LUKS crypted disk:
  * `/`: arch linux install
  * `/home`: home directory

I used parted to make partitions on my NVMe drive :

```bash
parted /dev/nvme0n1
```

This to configure this way:
```bash
Number  Start   End     Size    File system  Name  Flags
 1      1049kB  512MB   511MB   fat32        efi   boot, esp
 2      512MB   1024GB  1024GB               arch
```

Note: the used flags, do not forget to add them. Also for optimized partition, use multiples of 2 (logic) and percentages to let parted do the optimization. Finally, I'm not using swap to optimize my laptop performances.

# Format partitions

Initialize `/boot` device:

```bash
mkfs.vfat -F32 -n EFI /dev/nvme0n1p1
```

Now let's create the crypted partition:

```bash
cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup luksOpen /dev/nvme0n1p2 luks
```

I wanted to have LVM in order to easily later change the partition configuration if I want:

```bash
pvcreate /dev/mapper/luks
vgcreate vg0 /dev/mapper/luks
lvcreate -L 384G vg0 -n root
lvcreate -l +100%FREE vg0 -n home
```

Then format to ext4:

```bash
mkfs.ext4 -L root /dev/mapper/vg0-root
mkfs.ext4 -L home /dev/mapper/vg0-home
```

# Install Arch base

To install Arch, I needed to mount the partitions first:

```bash
mount /dev/mapper/vg0-root /mnt
mkdir /mnt/boot /mnt/home
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/mapper/vg0-home /mnt/home
```

Install the packages:

```
pacstrap /mnt base linux linux-firmware lvm2 intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
echo 'tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0' >> /mnt/etc/fstab
```

**Important: update the fstab file by changing 'relatime' to 'noatime' on non-boot partitions in order to preserve NVMe lifetime**

# Basic configuration

Now Arch is installed, I needed to configure the basics:

```bash
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'fr_FR.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=fr-latin9' > /etc/vconsole.conf
```

**Define your hostname** in the first variable and apply then the commands:

```bash
myhostname='define here the hostname'
echo "$myhostname" > /etc/hostname
echo '127.0.0.1	localhost' > /etc/hosts
echo '::1	localhost' >> /etc/hosts
echo "127.0.1.1	$myhostname.localdomain	$myhostname" >> /etc/hosts
```

# Initramfs

Edit the `/etc/mkinitcpio.conf` file and update the `HOOKS` part accordingly:

```bash
HOOKS=(base udev autodetect modconf block keyboard keymap encrypt lvm2 filesystems fsck)
```

And update the initramfs then:

```bash
mkinitcpio -P
```

# Bootloader

I'm using the simplest bootloader (no need grub):

```bash
bootctl --path=/boot install
echo 'default arch' > /boot/loader/loader.conf
echo 'console-mode 1' >> /boot/loader/loader.conf 
echo 'timeout 3' >> /boot/loader/loader.conf
```

And adding this specific configuration to boot on the crypted device:

```bash
UUID=$(blkid | grep crypto_LUKS | sed -r 's/.+UUID="(.+)"?.+/\1/')
echo 'title Arch Linux' > /boot/loader/entries/arch.conf
echo 'linux /vmlinuz-linux' >> /boot/loader/entries/arch.conf
echo 'initrd /intel-ucode.img' >> /boot/loader/entries/arch.conf
echo 'initrd /initramfs-linux.img' >> /boot/loader/entries/arch.conf
echo "options cryptdevice=UUID=${UUID}:vg0 root=/dev/mapper/vg0-root rw intel_pstate=no_hwpi msr.allow_writes=on" >> /boot/loader/entries/arch.conf
```

Note: you can add ```mitigations=off``` if you want more performances. But it will allow Spectre and Metldown security issues (https://meltdownattack.com/).

# End install

Before ending, **install Network Manager** or anything you need for the network part.

To finish, setup a root password:
```bash
passwd
```

And exist properly by unmounting partitions:

```bash
exit
umount /mnt/home /mnt/boot
umount /mnt
```

Reboot and you're done :)

# Restore

If you want to restore from a previous install, here are some advises I can give to you:

1. Get a packages list from your old workstation: `pacman -Qqe > ~/pacman_packages`
2. On your new workstation, re-inject them (with fish shell): `for i in (cat pacman_packages) ; yay -Sy $i ; end`
3. Finally move current `/etc` to `/etc.old` and restore your /etc backup

Steps order is important because if you restore `/etc` before the 2nd step, some packages install will fail because of already existing files in `/etc`.

Hope this will help others to speed up their install like me :)

 [1]: https://www.archlinux.org/
 [2]: https://wiki.archlinux.org/index.php/Installation_guide
