---
title: Activation TRIM sur OS X
author: Deimos
type: post
date: 2011-03-27T08:03:55+00:00
url: /2011/03/27/activation-trim-sur-os-x/
categories:
  - Hi-Tech
  - Mac
tags:
  - Hi-Tech
  - Mac

---

Le [TRIM][1] permet de modifier le comportement de l’OS avec un disque SSD. Sur Mac OS X, aujourd’hui il n’y a que les SSD “Apple” qui ont cette techno. Le but de cette instruction est de maintenir la vitesse du SSD tout au long de sa vie, évitant le ralentissement que les premiers modèles rencontraient une fois que toutes les cellules étaient écrites au moins une fois.
  
Heureusement, d'autres gens s'y sont pencher pour l'activer sur n'importe quel type de SSD. Je l'ai essayer et ça marche :-)

Voici le lien pour patcher le driver : [TRIMEnabler][2]
  
Et le résultat sur mon OCZ :

![trim_enable-300x147](/images/trim_enable-300x147.png)

Source : [Macbidouille][3]

 [1]: http://fr.wikipedia.org/wiki/TRIM
 [2]: http://groths.org/trimenabler/TrimEnabler.dmg "TRIMEnabler"
 [3]: http://www.macbidouille.com/news/2011/03/26/la-solution-universelle-pour-activer-le-trim
