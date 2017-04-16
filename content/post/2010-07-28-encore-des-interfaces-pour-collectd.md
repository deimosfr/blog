---
title: Encore des interfaces pour Collectd
author: Deimos
type: post
date: 2010-07-28T15:28:10+00:00
url: /2010/07/28/encore-des-interfaces-pour-collectd/
categories:
  - Hi-Tech
  - Linux
  - Web
tags:
  - Hi-Tech
  - Linux
  - Web

---

Je commence vraiment à utiliser collectd et il faut absolument une belle interface qui fait pas mal de trucs. Seulement voilà, le problème c’est que malgré qu’il y ai une 10 d’interfaces, elles sont toutes assez moche et peu fonctionnelle. Bref, il faut en utiliser plusieurs pour avoir un truc sympas.

Voici celles qui m'ont semblées intéressantes :

  * [Collection3](http://wiki.deimos.fr/Collection3_:_Une_interface_web_pour_Collectd)

Interface simpliste, mais utile. C'est celle de base qui est plus ou moins recommandé par Collectd. Malheureusement elle ne gère pas les comparaisons.

![collection3-290x300](/images/collection3-290x300.png)

  * [Jarmon](http://wiki.deimos.fr/Jarmon_:_Une_interface_web_pour_Collectd)

Jarmon est sympas sur sur système de zoom, mais ne gère pas les comparaisons non plus. De plus, elle ne gère pas du multi host simplement.

![jarmon-300x227](/images/jarmon-300x227.png)

  * [Heymon](http://wiki.deimos.fr/Heymon_:_Une_interface_web_pour_Collectd)

Heymon permet de faire des comparaisons sur 1 seul graph. C'est pratique mais ça peut vite devenir galère. Pour corriger ce problème, il y a un dashboard sur lequel on peut préenregistrer des paramètres.

![heymon-300x201](/images/heymon-300x201.png)

Conclusion: J'ai fais des docs pour ces 3 interfaces et j'en utilise 2 qui sont Collection3 et Heymon. Collection3 pour avoir tous les graphs d'un host sur une seule interface et Heymon pour les superbes comparaisons.
