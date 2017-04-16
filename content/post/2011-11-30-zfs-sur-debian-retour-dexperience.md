---
title: 'ZFS sur Debian : Retour d’expérience'
author: Deimos
type: post
date: 2011-11-30T13:10:57+00:00
url: /2011/11/30/zfs-sur-debian-retour-dexperience/
image: http://wiki.deimos.fr/images/d/d1/logo_zfs.jpg
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---
![Zfs_logo](http://wiki.deimos.fr/images/d/d1/logo_zfs.jpg)

J'ai reçu dans la semaine un mail sur un retour d'expérience pour ZFS sur Debian.
  
Vu que ce n'est pas la première fois, j'ai décidé de faire un petit article reprenant les échanges de mails que j'ai eu avec Mr Thierry Dijoux pour toutes les personnes intéressées.

**Thierry Dijoux**

> Bonjour,
  
> j'ai beaucoup apprécier votre note concernant l'installation de ZFS sur Debian. Ca marche très bien, et je me demandais si vous aviez assez de recul vis à vis des tests que vous avez fait pour vous demander si l'installation de ZFS sur une debian en production était envisageable ou pas ?
  
> D'avance merci pour votre réponse.

**Moi**

> Bonjour,
> 
> J'ai aujourd'hui toujours ce Debian (plutôt Ubuntu) en fonction pour un besoin personnel. Après 2 pertes de disque (problème hard), je dois avouer que le ZFS fonctionne plutôt bien.
> 
> Pour un besoin en production, c'est une de mes problématiques aujourd'hui. Je ne fais pas assez confiance à la solution ZFS on Linux, même si personnellement j'en suis très satisfait. Le manque d'intégration de la part des distributions Linux me pose des problèmes sur la pérennité de la solution.
  
> Je ne connais pas vos besoins, mais si aujourd'hui vous voulez absolument du ZFS sur une Debian, je vous recommanderais plutôt kFreebsd. Au moins c'est Debian, c'est en version stable et je peux vous assurer que le ZFS fonctionne très bien dessus.
> 
> Le choix n'est pas simple suivant les entreprises par rapport à l’homogénéité que l'on souhaites apporter à son parc informatique.
  
> Pour information, aujourd'hui, pour une solution de backup en production, j'ai voulu prendre kFreebsd, mais l'absence de fonctionnalités (car encore très jeune) m'ont fait partir sur du FreeBSD pour avoir du ZFS et des fonctionnalités avancées.
> 
> Vous le voyez, il est difficile, même pour mes besoins aujourd'hui de répondre avec précision à votre question.
> 
> Merci

**Thierry Dijoux**

> Merci de votre réponse.
  
> Concernant mes besoins, se serait, comme pour vous si j'ai bien compris, pour une problématique de stockage de sauvegarde. J'ai essayé plusieurs solutions, à savoir sdfs (opendedup), et lessfs, sans être totalement satisfait... J'ai aussi testé KFreeBsd ,et pour le moment, je ne suis pas convaincu...
  
> Je pensais me tourné vers du freebsd, mais ça veut dire apprentissage et formation de l'équipe... Choix cornélien !

Comme vous l'avez compris, ZFS est aujourd'hui un atout majeur dans des solutions de stockage, mais son manque d'adoption (souvent lié à la license) est un problème pour le choix de l'OS.