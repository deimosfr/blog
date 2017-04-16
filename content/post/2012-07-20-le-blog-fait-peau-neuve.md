---
title: Le blog fait peau neuve / Flux RSS
author: Deimos
type: post
date: 2012-07-20T10:00:18+00:00
url: /2012/07/20/le-blog-fait-peau-neuve/
categories:
  - Hi-Tech
  - Web
tags:
  - Hi-Tech
  - Web

---

Un gros travail d'optimisation à été effectué et les pages se chargent relativement vite maintenant. On est passé de 18s à 2s dans les meilleurs cas. Je continue encore à essayer de baisser le temps de chargement, mais ça devient difficile. Je pense faire un article sous peu avec tout ce qu'il à fallu mettre en œuvre pour arriver à cela. Mais en gros on est passé d'un lighttpd à un Apache+Varnish+PHP APC+W3C Total Cache. Bref du cache à beaucoup de niveaux. Le wiki en à du coup hérité également :-).

Certains d'entre vous me demanderont pourquoi je ne suis pas passé à Nginx. J'ai voulu repasser à Apache pour avoir des fonctionnalités que Lighttpd ne m'offrait pas. Nginx étant encore un peu jeune, ces mêmes fonctionnalités me manquent aussi (les htaccess entre autre). Je pense qu'un jour je finirais par y passer, mais pour le moment l'heure est aux serveurs de cache qui remplissent parfaitement leur rôle :-)

Pour ce qui est de l'adresse, certains d'entre vous auront remarqué qu'on y accède via <http://blog.deimos.fr>. Bien que j'ai fait les redirections, il est possible que l'ancien flux RSS soit mort. C'est pourquoi je vous recommande le nouveau.

N'hésitez pas à me dire si cette nouvelle interface vous plaît et si vous sentez que depuis quelques temps, le temps de réactivité du site est plus confortable. Merciiiii :-)