---
title: 'Mise à jour OpenBSD 4.6 -> 4.7 pas sans mal'
author: Deimos
type: post
date: 2010-05-22T06:35:57+00:00
url: /2010/05/22/mise-a-jour-openbsd-4-6-4-7-pas-sans-mal/
categories:
  - Hi-Tech
  - OpenBSD
  - Soekris
tags:
  - Hi-Tech
  - OpenBSD
  - Soekris

---

Encore une fois, ça a été la tannée avec ce Packet Filter ! Ils changent tout le temps pas mal de trucs. Mon serveur était donc inaccessible cette nuit à cause de cette upgrade.

J'ai déjà encore galérer pour foutre ce putain de PXE. J'ai pourtant suivit ma doc que j'avais faite précédemment, mais là, rien à faire, le PXE ne voulait pas être reconnu. J'ai donc décider d'en faire un sous OpenBSD (OpenBSD pour installer OpenBSD, quoi de plus naturelle...) et vais [améliorer la doc ici][1]. Et sur OpenBSD, ca a été très vite et très facile.

Ensuite j'ai donc gentillement fait mon upgrade comme indiqué sur le site, fait les changements appropriés par rapport aux nouvelles règles de NAT et RDR. Malheureusement toutes mes redirections étaient bloquées par la ligne "block in all".
  
J'ai mis un peu de temps à voir (c'était écrit dans les notes d'upgrades, mais à 2h du mat on a plus forcément les yeux en face des trous) qu'en fait ils ont décider de changer l'ordre d'annonce des lignes de redirections. Elles doivent en effet être après le "block in all". Visiblement le NAT n'a lui pas besoin de se trouver après.

Voilà, je ne suis pas mécontent d'avoir trouver la solutions après quelques heures de repos.

 [1]: http://wiki.deimos.fr/TFTP_:_PXE_Serveur,_d%C3%A9ploiement_d%27OS_sous_Linux
