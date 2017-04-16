---
title: Réécriture d’URL Apache en cachant le port
author: Deimos
type: post
date: 2011-04-12T13:02:30+00:00
url: /2011/04/12/reecriture-durl-apache-en-cachant-le-port/
image: http://wiki.deimos.fr/images/9/95/logo_apache.png
categories:
  - Hi-Tech
  - Linux
  - Web
tags:
  - Hi-Tech
  - Linux
  - Web

---
![Apache_logo](http://wiki.deimos.fr/images/9/95/logo_apache.png)

Youhou quel titre ! Il y a quelques années, un de mes collègues avait cherché le moyen de faire de la réécriture d'URL (ce qui fonctionnait plutôt bien), mais sans cacher le numéro du port.

Pour toi public, voici donc la solution. Il faut tout simplement utiliser le module proxy d'Apache pour faire une réécriture d'URL. La [documentation est ici][1].

 [1]: http://wiki.deimos.fr/Proxy_:_Cr%C3%A9er_un_proxy_avec_Apache