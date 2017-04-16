---
title: Wiki + Blog répliqués et load balancés
author: Deimos
type: post
date: 2009-10-04T20:08:11+00:00
url: /2009/10/04/wiki-blog-repliques-et-load-balances/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

Bon, voilà mon blog et mon wiki répliqués entre eux avec :
 
* Réplication MySQL master to master
  
* Un simple rsync pour les fichiers (pas encore de DRBD + OCFS2)
  
Et pour ce qui est du load balancing, c'est qu'un simple round robin. Pas encore de Failover non plus. A venir donc.
