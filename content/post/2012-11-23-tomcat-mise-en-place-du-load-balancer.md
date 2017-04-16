---
title: 'Tomcat : Mise en place du load balancer'
author: Deimos
type: post
date: 2012-11-23T11:00:26+00:00
url: /2012/11/23/tomcat-mise-en-place-du-load-balancer/
image: /images/logo_tomcat.png
thumbnailImage: /thumbnails/logo_tomcat.png
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
![Tomcat_logo](/images/logo_tomcat.png)
Toujours dans la continuité des articles sur Tomcat, on commence à rentrer dans du lourd et faire de la répartition de charge. Ça a l'avantage d'être assez facile et rapide à mettre en place. La mise en place du load balancing est faite au niveau du mod_jk comme ceci :

![Tomcat_loadbalancing](http://wiki.deimos.fr/images/a/a8/Tomcat_loadbalancing.png)

Je vous laisse [regarder la doc pour sa mise en place](http://wiki.deimos.fr/Tomcat_:_Mise_en_place_d%27un_serveur_Tomcat#Load_Balancing).