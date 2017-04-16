---
title: Les ACL c’est top
author: Deimos
type: post
date: 2009-10-17T08:21:38+00:00
url: /2009/10/17/les-acl-cest-top/
categories:
  - Hi-Tech
  - Linux
  - Solaris
tags:
  - Hi-Tech
  - Linux
  - Solaris

---

Une fois de plus, je vous livre [ma petite doc qui porte cette fois ci sur les ACL Solaris][1]. J’ai beaucoup pompé sur la doc officielle mais ai essayer de raccourcir au maximum pour raccourcir et ne prendre que ce qui est le plus vitale.
 
Ca donne quand même une belle doc du fait que la complexité de la chose. En effet, pas de grande similitudes avec les [ACL Linux][2] pour le côté utilisation, parcontre dans les faits, le système est assez similaire. Il y a biensûre des bons et des mauvais côté dans la version Solaris par rapport à Linux, mais une fois aquis je dois avouer que c'est fort pratique et que ça fonctionne vraiment très bien.
  
De plus, si votre filesystem est ZFS, la chose est encore plus aisée et l'activation du mode d'ACL peut être fait à chaud sans avoir à démonter et remonter la partition (le rêve quoi). Pour ceux qui veulent vraiment utiliser les ACL en production, je leur recommande de lire en complément de ma documentation, l'officielle qui pourrait les éclaircir sur des points que je n'ai pas forcément abordés.

 [1]: http://wiki.deimos.fr/ACL_:_Impl%C3%A9mentation_des_droits_de_type_NT_sur_Solaris
 [2]: http://wiki.deimos.fr/ACL_:_Impl%C3%A9mentation_des_droits_de_type_NT_sur_Linux
