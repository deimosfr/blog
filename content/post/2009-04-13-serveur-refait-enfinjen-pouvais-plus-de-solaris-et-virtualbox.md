---
title: Serveur refait !!! Enfin…j’en pouvais plus de Solaris et VirtualBox
author: Deimos
type: post
date: 2009-04-13T21:30:54+00:00
url: /2009/04/13/serveur-refait-enfinjen-pouvais-plus-de-solaris-et-virtualbox/
categories:
  - Hi-Tech
  - Linux
  - Web
tags:
  - Hi-Tech
  - Linux
  - Web

---

Bon… allez, je vais vous expliquer déjà pourquoi j’ai refais mon serveur.

Dans mes précédents posts datant du mois de décembre, vous avez pu lire que j'étais passé de mon serveur Debian 32 bits etch (stable de l'époque) vers Solaris et adoptant la virtualisation avec **VirtualBox** le temps de patienter pour **xVM Server**.

Aujourd'hui, **xVM Server n'est toujours pas sorti**, VirtualBox n'est vraiment, vraiment pas fait pour de la pseudo prod (donc imaginez la prod), contrairement à ce qui est dit sur le site officiel de Sun. **Soyons réaliste, VirtualBox est un bon produit, mais pour rester pour des tests sur les machines de bureau**.

Entre les problèmes de lenteur générale, les problèmes de timer (décalage des Vms dans le temps en permanace), les gros problèmes de perfs réseaux qui ça apporte sur Solaris et au vue de la dernière version (2.2) buggué jusqu'à la moile, _VirtualBox est définitivement trop jeune_.

Je suis donc repassé sous **Debian en 64 bit**s cette fois ci et oh magie, ça trace (mais genre rien à voir) à côté de la version 32 bits. Donc pour la couche de storage, voici ce que j'ai adopté :
  
*** Raid 5 software sur 4 disques de 1To (a la place du ZFS)
  
* Un VG sur le Raid5 et donc du LVM (a la place du ZFS)
  
* De l'ext3 sur les LV (a la place du ZFS)
  
* De l'ENCFS avec FUSE (j'avais pas encore mis la main sur un truc sympas)**
  
Donc bon, oui le **ZFS c'est quand même nettement plus avancé** que tout le reste. Mais fuser (oui le verbe ;-p) mes 4 disques en ZFS...mummm je trouve ça un peu cracra. Donc mon installe attendra la _stabilisation du BTRFS_.

Pour la partie virtualisation, je dirais que les conférences du salon de l'OpenSource m'ont bien aidée pour mon choix. J'allais partir sur du Xen à la base et c'est vrai que là bas, ils clamaient haut et fort **KVM**. Et j'avoue que 2 ans après, les efforts effectués sont tout simplement **innatendus**. C'est stable, c'est simple, c'est très performant et en plus ça sens bon.

Pour le côté ailleteutek, j'ai passé mon serveur web sous Lighttpd histoire de tatouiller un peu et... ouaouuuuu ça trace ! Bon, les perfs de KVM doivent y faire aussi quand même un chouille, mais c'est vrai que ça me fait quelques nouvelles technos d'un coup là et je ne suis pour le moment vraiment pas déçu.

Nous verrons plus tard comment les choses se déroule, notamment pour un serveur multimedia (uPnp), va falloir que ça tienne la route sans plantage ni sacades.

A terme, j'aimerais passer **mon postfix et mon serveur web sous FreeBSD**. On verra ça dans un second temps. Pour ce qui est des docs, je n'ai pas encore eu le temps de les rédiger, mais les liens suivront rapidement.

En bref, pour le moment, c'est la joie retrouvée. Debian, c'est quand même un putain d'OS, le meilleur à mes yeux aujourd'hui pour le monde du serveur.

Allez...Ramone, yé vé mé couché maintenan
  
é si yé vé étre en fourme démin, yé vé yallé tou dé suite.

Asta maniana
