---
title: 'Ansible: LXC role updated for Jessie'
author: Deimos
type: post
date: 2015-02-25T11:00:40+00:00
url: /2015/02/25/ansible-lxc-role-updated-for-jessie/
image: /images/logo_lxc.png
thumbnailImage: /thumbnails/logo_lxc.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux

---
![lxc_logo](/images/logo_lxc.png)
Since several weeks, I'm playing a lot with Debian Jessie as a server. I discovered some bugs, reported them to Debian, they've been fixed etc...good news! I also wanted to test the new version of LXC.

So I decided to upgrade my 2 personal servers to Jessie. But that wasn't so easy with Systemd. I still encounter non critical issues and going to prepare report bugs for Debian (cgroups issues with systemd).
  
The new version of LXC inside Debian is better integrated than the previous was (which was really younger), so [I updated the ANsible LXC role](https://galaxy.ansible.com/deimosfr/lxc/) for Jessie.

Hope you'll enjoy.
