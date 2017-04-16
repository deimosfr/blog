---
title: 'Packer: win time by easily testing your app on multiple platforms'
author: Deimos
type: post
date: 2014-03-18T11:00:40+00:00
url: /2014/03/18/packer-win-time-by-easily-testing-your-app-on-multiple-platforms/
image: /images/logo_packer.png
thumbnailImage: /thumbnails/logo_packer.png
thumbnailImagePosition: left
rating:
  - 4.5
votes:
  - 2
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
![packer](/images/logo_packer.png)
[Packer](http://www.packer.io) is a tool for creating identical machine images for multiple platforms from a single source configuration. You can win a lot of time by testing your application on multiple environments (AWS, OpenStack, VirtualBox, Vmware...).

Let's say you've got a LAMP environment to deploy in production on OpenStack. However, you can't perform your development/integration on it as you don't have access yet. You can't loose time and wait for it to test. So you can use Packer to deploy an OS on VirtualBox/[Vagrant](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines), Ansible/[Puppet](https://wiki.deimos.fr/Puppet_:_Solution_de_gestion_de_fichier_de_configuration)/Chef to perform configuration management and other things to finish your development/integration.
  
A few weeks later, you don't want to adapt what you have done, so you can configure an additional provisioner to deploy automatically your Packer setup on this new environment. Let's say now you need to deploy it on EC2 as well...you don't have anything to do more than adding a new provisioner.

Packer could also be used for Continuous Integration system, to test build on several different systems.

Packer is an interesting solution when you're using multiple and different environments.