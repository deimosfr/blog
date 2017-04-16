---
title: FSCK à chaud sur EXT3/4
author: Deimos
type: post
date: 2012-05-13T10:00:31+00:00
url: /2012/05/13/fsck-a-chaud-sur-ext34/
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---

Ouuuuuuuu le titre est kiffant hein ! Toi aussi tu as des contraintes super chaude de disponibilité, tu n’as pas la chance d’avoir du ZFS sur ton OS du bien ou tu te dis que BTRFS c’est encore trop jeune et tu dois supporter de l’ext encore quelques temps ?

Alors ceci est fait pour toi !!! J'ai concocté un petit script (un peu sale oui je l'avoue, mais il a le mérite de bien fonctionner) que j'ai pomper [sur une discussion Red Hat](https://www.redhat.com/archives/ext3-users/2008-January/msg00032.html) permettant donc de jouer avec les snapshot pour fsckiser (oui le verbe) à la volée tous les LV de type ext3 et 4 sur une machine !

Mais quelle merveille me direz vous ! Je vous propose donc [le petit lien qui va bien](http://wiki.deimos.fr/LVM_:_Utilisation_des_LVM#FSCK_.C3.A0_chaud_sous_ext3.2F4). On dit merci qui ?
