---
title: FreeBSD pas si stable…
author: Deimos
type: post
date: 2010-11-01T09:29:21+00:00
url: /2010/11/01/freebsd-pas-si-stable/
image: /images/logo_freebsd.png
thumbnailImage: /thumbnails/logo_freebsd.png
thumbnailImagePosition: left
categories:
  - FreeBSD
  - Hi-Tech
tags:
  - FreeBSD
  - Hi-Tech

---
![freebsd](/images/logo_freebsd.png)
J'ai une très mauvaise expérience actuellement avec FreeBSD. J'ai effectuer plusieurs tests hard avant de remettre sur FreeBSD.

Pourquoi avais je pris FreeBSD au lieu de Debian ? :
  
* Pour le ZFS
  
* Sa réputation
  
* Pour essayer

Seulement voilà, quand on commence à faire du fuse + encfs + sshfs...bah c'est pas aussi stable qu'on est en droit de penser. J'ai des kernel panic qui ne font même pas rebooter ma machine (alors que c'est pourtant le comportement par défaut de FreeBSD) visiblement à cause de Fuse ou SSHfs et c'est très handicapant. J'ai noté que lorsqu'on faisait de la copie de fichier dont l'arborescence contient des dossiers avec espace, ça freezait. De même sur des commandes shell basiques, tel qu'une boucle while, ça arrivait à faire crasher la machine.

J'ai pourtant prit une version stable de FreeBSD, qu'on ne me jette pas la pierre (huhu), updaté à la dernière version stable tout ce que j'ai pu mais rien à faire. L'idée serait que je passes du temps à faire du bug report, mais je n'ai pas forcément suffisamment le temps me m'adonner à ce genre d'exercices. De plus, pour de simple trucs comme ça, si ça crash, j'ai peur de la suite.

Donc maintenant la question est...est-ce que je me bouge le cul et fait du bug report ou passe à Debian. Et si je passe à Debian, je fais du kfreebsd ou du btrfs ?

Après une petite étude, la FAQ de Debian ne donne pas de réponse à la question "Que kfreebsd en production ?". Quant au BTRFS, on peut perdre des données en cas de crash car l'outil fsck n'est pas encore prêt.

Ceux qui ont des pistes pour mes problèmes FreeBSD ou des réponses à mes questions, sont les bienvenues.