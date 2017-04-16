---
title: 'Vagrant : I finally dropped KVM for VirtualBox'
author: Deimos
type: post
date: 2013-07-11T10:00:05+00:00
url: /2013/07/11/vagrant-i-finally-dropped-kvm-for-virtualbox/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
  - Virtualization
tags:
  - Hi-Tech
  - Linux
  - Virtualization

---
![Vagrant-logo](/images/logo_vagrant.png)

A few months ago, I wanted to install as fast as possible new VMs headless. In addition, I wanted to give the possibility for my ex colleagues to be able to easily create remote VMs on my desktop as most of them got slow machines. [KVM did the job perfectly](http://blog.deimos.fr/2013/03/19/remplacer-virtualbox-par-kvm-sur-son-desktop/). I also needed to quickly deploy Debian, so [I made a pressed file](http://blog.deimos.fr/2013/04/02/debian-wheezy-mise-a-jour-du-preseed/).

Here at eNovance, I can be selfish :-p as everybody got a fast machine (Thanks eNovance).  I remember that [Yanis](https://twitter.com/YanisGuenane) tried to convince me about a software called [Vagrant](http://www.vagrantup.com/). It's a VirtualBox manager that can quickly deploy instances based on remote websites. In fact it does really more than this like customizing instances...

Last week [Sebastien](https://twitter.com/sebastien_han) talked to me about Vagrant. Once again ! I decided to test it as I absolutely want to win time on repetitive tasks. What I can say is : try it, you won't go back !

I've made [a quick basic tutorial on Vagrant](http://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines) as the documentation is quite easy to read. So it's just a quick setup and introduction, but enough to start using in less than 5 min.

I hope this will help some of you to try it.