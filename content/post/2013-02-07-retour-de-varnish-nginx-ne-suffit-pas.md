---
title: Retour de Varnish, Nginx ne suffit pas !
author: Deimos
type: post
date: 2013-02-07T11:00:18+00:00
url: /2013/02/07/retour-de-varnish-nginx-ne-suffit-pas/
image: /images/logo_varnish.png
thumbnailImage: /thumbnails/logo_varnish.png
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
![Varnish_logo](/images/logo_varnish.png)
Le titre de l'article en dit long. Depuis que je suis passé à Nginx, c'est vrai, c'est le jour et la nuit comparé à Apache. J'en suis extrêmement satisfait ! Cependant, malgré la gestion du cache via Nginx, les performances ne sont pas aussi bonnes qu'attendues.

J'ai donc testé Nginx avec Varnish, histoire de me refaire une opinion et effectivement Varnish fait vraiment la différence, non seulement côté temps de réponse, mais surtout côté CPU !

Pour vous donner une idée, **je suis passé de 80% d'utilisation CPU sans Varnish, à 20% avec Varnish** !

J'ai fais une petite [doc pour montrer comment bencher avec Apache Benchmark](http://wiki.deimos.fr/Benchmarker_son_site_web), elle est ici. Et pour [mettre en place un Varnish, je vous rappelle que la doc est ici](http://wiki.deimos.fr/Varnish_:_un_acc%C3%A9l%C3%A9rateur_de_site_web).

Bons benchs