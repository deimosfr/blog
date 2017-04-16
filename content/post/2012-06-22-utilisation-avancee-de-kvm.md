---
title: Utilisation avancée de KVM
author: Deimos
type: post
date: 2012-06-22T10:00:31+00:00
url: /2012/06/22/utilisation-avancee-de-kvm/
image: /images/logo_kvm.png
thumbnailImage: /thumbnails/logo_kvm.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![Kvm-logo](/images/logo_kvm.png)
Vous allez voir dans quelques temps que le blog, ainsi que le wiki vont tracer ! Avec mon pote [Evoxmusic](http://blog.evoxmusic.fr/), on vient de se prendre une [dedibox](http://www.online.net/) de la mort. Nous en profitons donc pour utiliser KVM et avons recours à des fonctionnalités un peu plus avancées que start and stop. Par exemple :

  * Utilisation des VMs en NAT
  * Une configuration iptables pour passer le NAT
  * Ajouter des disques à chaud
  * Dédier des CPU à une VM

J'ai donc mis à jour [la documentation sur KVM](http://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM) avec les fonctionnalités citées ci dessus.