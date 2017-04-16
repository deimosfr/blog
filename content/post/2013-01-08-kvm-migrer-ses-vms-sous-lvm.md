---
title: 'KVM : migrer ses VMs sous LVM'
author: Deimos
type: post
date: 2013-01-08T11:00:30+00:00
url: /2013/01/08/kvm-migrer-ses-vms-sous-lvm/
image: /images/logo_kvm.png
thumbnailImage: /thumbnails/logo_kvm.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Virtualization
tags:
  - Hi-Tech
  - Virtualization

---
![Kvm-logo](/images/logo_kvm.png)
Pour migrer une VM avec des disques de type qcow2, c'est très simple, il suffit de les copier les fichiers tel quel. Mais lorsqu'on utilise du LVM, la migration peut sembler forcément un peu plus complexe, bien qu'elle ne le soit pas vraiment.

J'ai donc fait [une petite section sur mon article KVM qui parle de migration de VM sous LVM](http://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM#Transfert_a_LVM_disk_based_VM).