---
title: 'Freebox : le NAS à 0€'
author: Deimos
type: post
date: 2012-08-23T10:00:35+00:00
url: /2012/08/23/freebox-le-nas-a-0e/
categories:
  - Hi-Tech
  - Others
  - Private life
tags:
  - Hi-Tech
  - Others
  - Private life

---
![free_logo-300x124](/images/logo_free.png)

La semaine dernière, j'ai commencé à en avoir marre de mon FreeNAS. Non pas que ça ne fonctionne pas bien, mais devoir avoir une machine dédiée, allumée, pour lire les films de famille :-p et stocker mes photos etc... bref, pénible !

Je me suis dis : "Bon un Nas, ça serait pas mal quand même, mais ça fait cher pour l'utilité que je souhaites !". Surtout que je ne souhaites pas des fonctionnalités de fou, **je veux un truc en du RAID 1, qui lit tout les formats video et qui ne consomme pas beaucoup lorsque je n'utilise pas !** Et tout d'un coup, je me suis rappelé que **la Freebox faisait tourner VLC** ! J'ai donc tester quelques AVI et MKV....magie **tout fonctionne** ! J'ai donc transférer quelques films et encore une fois, ils passent tous !

Je me suis dis qu'il était donc temps d'investir dans un boitier RAID 1. Le but est d'accéder via réseaux aux données et qu'en même temps, ce soit dispo sur la Freebox. Je cherche un peu sur le net, je me retrouve à vouloir me prendre un NAS et quelques heures plus tard, je me dis que le NAS connecté à la Freebox c'est ridicule, puisqu'elle fait déjà tout ce que je veux cette petite Freebox. Je décide alors de bouger le cul de ma chaise du boulot et faire quelques mètres pour rejoindre Macway et là je tombe sur ce truc là : [Le boitier Storeva](http://www.macway.com/fr/product/17470/boitier-storeva-aluice-xxl-2-x-hdd-35-raid-esata-firewire-400800.html).

J'avais déjà des disques de 1To, j'ai donc branché ce truc sur la Freebox server et miracle, ça fonctionne ! **Formaté en ext4 (oui le hfs+ déconne pas mal)**, ça lit tout sans soucis, j'ai la sécurité de mes données avec le RAID 1, c'est évolutif jusqu'à 3To (en RAID 1), bref....le kiffe !

Donc si vous ne voulez pas vous amputer d'un bras pour avoir un NAS à la maison, je vous conseil fortement la Freebox ! Il ne sera jamais trop tard pour acheter un NAS si vraiment vos besoins vont au delà de la Freebox.

J'espère que ça en aidera plus d'un qui a le même type de besoin que moi :-)