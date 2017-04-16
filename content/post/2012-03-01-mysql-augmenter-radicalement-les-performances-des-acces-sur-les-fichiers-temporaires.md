---
title: 'MySQL : Augmenter radicalement les performances des accès sur les fichiers temporaires'
author: Deimos
type: post
date: 2012-03-01T11:00:52+00:00
url: /2012/03/01/mysql-augmenter-radicalement-les-performances-des-acces-sur-les-fichiers-temporaires/
categories:
  - Hi-Tech
  - Linux
  - Solaris
tags:
  - Hi-Tech
  - Linux
  - Solaris

---
 
Si vous avez des problèmes de temps d’accès et de débit sur votre espace disque temporaire pour MySQL, alors cet article est fait pour vous.
 
La solution consiste donc à utiliser le filesystem tmpfs et rediriger ses fichiers temporaires dessus.

J'ai donc créer et mis à jour mes documentations. Vous aurez donc besoin de :

  * [Tmpfs sous Solaris](http://wiki.deimos.fr/Tmpfs_:_monter_un_filesystem_en_RAM_sous_Solaris)
  * [Tmpfs sous Linux](http://wiki.deimos.fr/Tmpfs_:_un_filesystem_en_ram_ou_comment_%C3%A9crire_en_ram)
  * [MySQL : augmenter les perfs pour les fichiers temporaires](http://wiki.deimos.fr/MysqlTuner_:_Optimiser_votre_serveur_MySQL#Augmenter_les_performances_pour_les_acc.C3.A8s_fichiers_temporaires)

&nbsp;
