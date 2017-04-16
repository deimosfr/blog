---
title: 'Vagrant: do not manage VBox Guest Additions manually anymore'
author: Deimos
type: post
date: 2014-02-28T11:00:52+00:00
url: /2014/02/28/vagrant-do-not-manage-vbox-guest-additions-manually-anymore/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
rating:
  - 4
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization

---
![Vagrant-logo](/images/logo_vagrant.png)

I recently discovered a Vagrant plugin that manage the VirtualBox Guest Additions automatically. I mean, when you launch a virtual machine, it automatically checks if the Guest Additions are installed. If it's not the case or if they are not up to date, installation of the latest version is made automatically !

[Here is how to install it](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines#VirtualBox_Guest_Additions).