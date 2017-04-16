---
title: 'PuPHPet : speed up your Vagrant deployment'
author: Deimos
type: post
date: 2013-08-06T10:00:00+00:00
url: /2013/08/06/puphpet-speed-up-your-vagrant-deployment/
categories:
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Puppet
  - Red Hat
  - SQL
  - Virtualization
  - Web
tags:
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Puppet
  - Red Hat
  - SQL
  - Virtualization
  - Web

---
![puphpet](/images/puphpet.png)

Vagrant is a fast solution build on top of VirtualBox. I already talked about it [in a previous post](http://blog.deimos.fr/2013/07/11/vagrant-i-finally-dropped-kvm-for-virtualbox/).

The thing is, you could do really more with Vagrant by adding [Puppet manifests](http://wiki.deimos.fr/Puppet_:_Solution_de_gestion_de_fichier_de_configuration) or Chef recipes in your Vagrant configuration file. For those who don't often use one of those 2 softwares, it quickly could transform into a nightmare when they want to deploy softwares in addition of the OS.

That's when [PuPHPet][1] comes into action. Simply by clicking on a web interface, it will help web developpers to get a fully working environment (LAMP). In addition, you can also add additional stuffs (packages, sql accounts, php settings...).

This solution makes win a lot of time for initiated and none initiated persons. Try it now on [PuPHPet][1] website !

 [1]: https://puphpet.com/#vagrant