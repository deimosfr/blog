---
title: Collectd pour remplacer Munin
author: Deimos
type: post
date: 2010-06-09T22:09:28+00:00
url: /2010/06/09/collectd-pour-remplacer-munin/
categories:
  - Hi-Tech
  - Linux
  - Solaris
tags:
  - collectd
  - monitoring

---

Pendant des années, j’ai adoré la simplicité de Munin. Et puis au fil du temps, avec les besoins du taf et notamment Solaris, ça devient de plus en plus galère de l’installer et d’avoir des graphs très précis. Je suis tombé sur [cet article][3] qui parle de [Collectd][4].

Je me suis donc intéressé à la chose et suis très satisfait du résultat. C'est très rapide, il existe plusieurs interfaces graphiques (plus ou moins jolie, plus ou moins fonctionnelles) et surtout, il y a une tonne de modules de base pour Collectd ! Sans parler du multicast, du mode proxy et autres techno en tout genre qui font de cette appli un must !

Pour ceux que ça intéresse, voici mes documentations :
  
* [Collectd : Installation et configuration de Collectd][1]
  
* [Collection3 : Une interface web pour Collectd][2]

 [1]: http://wiki.deimos.fr/Collectd_:_Installation_et_configuration_de_Collectd
 [2]: http://wiki.deimos.fr/Collection3_:_Une_interface_web_pour_Collectd
 [3]: http://www.rottenbytes.info/?p=309
 [4]: http://collectd.org/
