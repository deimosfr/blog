---
title: Utiliser l’API de Sabnzbd
author: Deimos
type: post
date: 2012-10-04T10:00:40+00:00
url: /2012/10/04/utiliser-lapi-de-sabnzbd/
image: http://wiki.deimos.fr/images/3/3e/Sabnzbd_logo.png
categories:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Developement
  - Hi-Tech
  - Linux

---
![Sabnzbd_logo](http://wiki.deimos.fr/images/3/3e/Sabnzbd_logo.png)

Je trouve qu'il ne manque pas grand chose à Sabnzbd pour qu'il soit parfait. Cependant certaines options manquent et heureusement l'API est là pour compenser. J'ai donc écris un script en python permettant de jouer avec l'API que délivre Sabnzbd. Je l'ai créer dans l'idée qu'il soit facile de rajouter une fonctionnalité via l'API. Ce script permet :

  * De voir les éléments que fournit l'API XML
  * De supprimer un certain nombre d'éléments dans l'historique

J'espère que ça aidera certains à se plonger dedans, améliorer mon script ou bien utiliser les fonctions déjà existantes. [Le script ainsi que les explications sur son fonctionnement se trouvent ici](http://wiki.deimos.fr/SABnzbd_:_Une_interface_web_pour_g%C3%A9rer_les_newsgroups#sabnzbd_api.py).