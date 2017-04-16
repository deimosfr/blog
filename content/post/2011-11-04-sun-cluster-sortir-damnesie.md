---
title: 'Sun Cluster : sortir d’amnésie'
author: Deimos
type: post
date: 2011-11-04T16:59:31+00:00
url: /2011/11/04/sun-cluster-sortir-damnesie/
categories:
  - Hi-Tech
  - Solaris
tags:
  - Hi-Tech
  - Solaris

---

Cette semaine, j’ai eu des GROOOOOOOOSSES merdes avec une baie de disques. Une fois réparée, mon quorum cluster était injoignable, bien que pourtant présent en tant que LUN sur la baie de disques.
 
Donc quant mes noeuds du serveur se sont mis à booter, l'absence de quorum empêchait le cluster de monter et je n'avais donc pas la main sur mes machines.

C'est donc un cluster de 6 noeuds qui était en amnésie (youpi). J'ai donc du modifier la configuration du cluster sur chaque noeud, la réasher et rebooter. Bref, la procédure n'est pas compliquée en soit, mais quant il est 2h du matin et que le quota de sommeil sur les 4 derniers jours est de l'ordre de 3 à 4h par nuit, ça commence à être difficile de procéder à ce genre d'actions.

[La documentation se trouve ici.](http://wiki.deimos.fr/Installation_et_configuration_du_SUN_Cluster#Recovering_from_amnesia)
