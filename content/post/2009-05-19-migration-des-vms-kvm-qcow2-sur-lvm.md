---
title: Migration des VMs KVM QCOW2 sur LVM
author: Deimos
type: post
date: 2009-05-19T06:43:12+00:00
url: /2009/05/19/migration-des-vms-kvm-qcow2-sur-lvm/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

Ca fait 2 ou 3 fois, que je perds sans trop savoir comment des VMs sur KVM.

Je suis certain que c'est dû aux images qcow2 (ceux qui me disent 'c'est à cause de tes disques' peuvent remballer leur langue car pour rappel, je suis en raid5 sur 4 disques).

Malheureusement, je n'ai pas de preuves pour affirmer ce que je dis plus haut, mais c'est plutôt l'experience que j'ai avec les images disques qui me faire dire ça.

C'est pourquoi j'ai chercher comment convertir tout ce petit monde en LVM et j'ai trouvé mon bonheur :-)

Oui oui, la doc est là : [http://wiki.deimos.fr/KVM\_:\_Mise\_en\_place\_de\_KVM][1]

Je passe donc mon temps à faire mes conversions (bien plus rapide que de refaire toutes les machines hein :-p)

 [1]: http://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM
