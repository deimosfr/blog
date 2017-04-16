---
title: Nginx et php-fpm
author: Deimos
type: post
date: 2012-10-14T10:00:42+00:00
url: /2012/10/14/nginx-php-fpm/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Web
tags:
  - Hi-Tech
  - Web

---
![Nginx-logo](/images/logo_ngnix.png)
Il y a quelques temps, j'avais parlé d'optimisations du blog et wiki. Dans les commentaires, j'avais échangé [oloncle](http://blog.deimos.fr/2012/07/20/le-blog-fait-peau-neuve/#comment-4508) et il m'a fait découvrir php-fpm. J'ai donc fais une petite documentation [pour sa mise en place](http://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#php-fpm).

J'ai fais quelques recherches également sur le net pour voir des benchs entre varnish et le cache nginx. Il apparait qu'il n'y a qu'environ 5% de performances de différence en faveur de Varnish, mais qu'il y a une plus grosse utilisation du CPU pour ce dernier. Je n'ai moi même pas encore fait des tests, mais les avis sur le net ont l'air de converger sur le fait que Varnish est dédié à la tâche de cache, tandis qu'Nginx n'étant q´une fonctionnalité s'en sort quand même très bien.

Je pense me lancer dans les tests dans quelques temps. En attendant, bonne lecture.