---
title: A tout cassé ? Pani pwoblem !
author: Deimos
type: post
date: 2012-02-10T11:00:39+00:00
url: /2012/02/10/a-tout-casse-pani-pwoblem/
categories:
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Hi-Tech
  - Linux
  - Red Hat

---

J’ai un collègue qui a fait une belle boulette (un chown -Rf mysql sur / !). Du coup la merde, il a fallu trouver une solution pour restaurer les droits.

Heureusement Red Hat à penser aux têtes en l'air et a mis dans la commande rpm les options *setperms et *setugids pour réparer les droits sur les packages installés. Bref de quoi réparer votre machine.

Donc si vous aussi vous avez boulétiser, sachez qu'une solution existe sur Red Hat.

J'ai fais [une petite documentation qui peut sauver la vie](http://wiki.deimos.fr/Restaurer_les_permissions_d%27une_Red_Hat).
