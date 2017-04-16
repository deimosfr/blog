---
title: 'DevStack : testez facilement et rapidement OpenStack'
author: Deimos
type: post
date: 2013-03-31T10:00:57+00:00
url: /2013/03/31/devstack-testez-facilement-et-rapidement-openstack/
image: /images/logo_devstack.png
thumbnailImage: /thumbnails/logo_devstack.png
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
![devstack](/images/logo_devstack.png)
Si vous voulez tester [OpenStack](http://www.openstack.org/) sans vous fatiguer, il existe un projet baptisé [DevStack](http://devstack.org/). C'est un simple script shell qui va vous construire une machine avec tous les composants nécessaire pour pouvoir tester et développer sur un environnement OpenStack.

Et ce qui est bien, c'est de pouvoir faire du Qemu dans du KVM. Bon attention aux performances et aux bugs quand même, je vous rappelle que c'est du test et que ça s'appuie sur la version actuelle du repository. Alors ceux qui voyaient ça comme le Saint Graal et se disaient qu'ils allaient pouvoir déployer des infras OpenStack en 2 sec, peuvent [retourner à leurs bouquins](http://docs.openstack.org/ops/) (d'ailleurs excellent).