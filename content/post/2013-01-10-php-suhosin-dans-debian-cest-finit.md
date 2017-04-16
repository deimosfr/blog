---
title: PHP et Suhosin dans Debian c’est fini
author: Deimos
type: post
date: 2013-01-10T11:00:59+00:00
url: /2013/01/10/php-suhosin-dans-debian-cest-finit/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Web
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Web

---
![debian_logo](/images/logo_debian.png)
C'est en migrant vers la dernière version de Debian (Wheezy) que je me suis rendu compte que php5-suhoshin avait disparu. Après quelques apt-cache et recherche sur le site de Debian, il n'y a effectivement plus de Suhoshin !

Pourquoi ? Tout simplement parce que les gars de chez Debian estiment que Suhoshin devrait être intégré mainstream dans le code de PHP et que ça ne devrait pas être aux distribution de les packager.

Je pense qu'ils ont effectivement entièrement raison, Suhoshin devrait être tout le temps présent, n'est pas très contraignant à maintenir et donc devrait être intégré dans PHP. C'est une partie sécurité importante donc maintenant, la balle est dans le camp de PHP. [Malheureusement, il semble que cela n'est pas prêt d'être intégré](http://news.php.net/php.internals/57610) :-(