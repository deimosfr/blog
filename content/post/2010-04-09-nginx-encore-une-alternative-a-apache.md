---
title: 'Nginx : Encore une alternative à Apache'
author: Deimos
type: post
date: 2010-04-09T18:39:18+00:00
url: /2010/04/09/nginx-encore-une-alternative-a-apache/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

Je viens de faire joujou avec Nginx suite à l’article dans dernier Linux Mag et parce que je vais m’en servir avec Puppet. Et bah c’est plutôt super bien foutu. J’ai été très étonné par la simplicité de la configuration par rapport à Apache qui au fil du temps est devenu une grosse usine à gaz. Avec [Lighttpd][1], ils deviennent des alternatives vraiment sérieuses à Apache avec surtout les performances et optimisation des ressources nettement meilleures.

D'après ce que j'ai pu lire, au niveaux des perfs, Nginx est légèrement plus rapide que Lighty (Lighttpd), mais par contre il consomme quand même moins. Après, pour la configuration, il est vrai que Nginx est beaucoup plus user friendly que Lighty. Pour Lighty, il y a des notions de regex a bien connaitre avant de s'aventurer dans la conf.

J'ai donc fait [une petite documentation sur Nginx][2] qui ravira les petits comme les grands de 7 à 77 ans.

 [1]: https://wiki.deimos.fr/Lighttpd_:_Installation_et_configuration_d%27une_alternative_d%27Apache
 [2]: https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache
