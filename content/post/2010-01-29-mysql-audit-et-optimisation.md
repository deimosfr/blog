---
title: 'MySQL : Audit et optimisation'
author: Deimos
type: post
date: 2010-01-29T06:14:18+00:00
url: /2010/01/29/mysql-audit-et-optimisation/
categories:
  - Hi-Tech
  - Linux
  - Solaris
tags:
  - Linux
  - mysql
  - Solaris

---

Depuis le début de la semaine et jusqu’à aujourd’hui, j’ai un expert MySQL qui est à côté de moi au taf. C’est fou tout ce qu’on peut apprendre :-p. Pour moi les optimisations MySQL n’étaient nécessaire que quand des milliers de personnes font des requêtes ou quand vraiment on ressent de grosses pertes de perfs etc…

Nous avons eu besoin de lui car c'est les pertes de perfs qui nous troublaient. Et ce qui est impressionnant c'est quant un requête met 2 sec a renvoyer un résultat, et qu'il arrive a optimiser pour que ça devienne 0.00 sec.

Bref, il y a une belle partie tunning de mémoire de MySQL, du cache, du Query cache et j'en passe. J'ai donc fais une petite doc pour faire un audit de ses plateformes. J'ai également modifier et améliorer la doc sur la synchronisation master to master avec des options en * améliorant la sécurité et des options en + améliorant la qualité du trafic.

La doc sur [l'optimisation est ici][1].
  
Pour [la réplication MySQL master to master, c'est ici][2].
  
Pour finir, une doc pour [lancer plusieurs instances MySQL sur la même machine][3].

 [1]: http://wiki.deimos.fr/MysqlTuner_:_Optimiser_votre_serveur_MySQL
 [2]: http://wiki.deimos.fr/Replication_Master_to_Master
 [3]: http://wiki.deimos.fr/Lancer_plusieurs_instances_de_MySQL_sur_Solaris
