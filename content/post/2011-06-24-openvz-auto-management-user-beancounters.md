---
title: OpenVZ Auto Management User Beancounters
author: Deimos
type: post
date: 2011-06-24T21:03:30+00:00
url: /2011/06/24/openvz-auto-management-user-beancounters/
categories:
  - Developement
  - Hi-Tech
  - Linux
tags:
  - Developement
  - Hi-Tech
  - Linux

---

Cette semaine j’ai appris à faire du Python pour voir un peu ce que ça donne comme langage. C’est pas mal du tout, il y a plein de built-in assez sympas. Je n’ai pas encore eu le temps de mettre à jour la doc de mon wiki par rapport à mes acquis, mais j’espère pouvoir le faire très prochainement.

Bref, j'en ai profité pour faire un truc qui sous OpenVZ est super relou : les User Beancounters. On passe son temps à y toucher quand on a un système qui évolue ! Je me suis donc lancer dans un outil permettant de gérer automatiquement ces petites bêtes et l'ai baptisé "[OpenVZ Auto Management User Beancounters](http://www.deimos.fr/gitweb/?p=vzautobean.git;a=summary)", alias "[vzautobean](http://www.deimos.fr/gitweb/?p=vzautobean.git;a=summary)" (évidemment créer en Python).

Ceci est donc la version 0.1 qui permet de faire l'essentiel, il y a peut être quelques petits bugs, je suis en test chez moi et pour le moment ça fonctionne correctement. N'hésitez pas à tester, me faire des retours, me proposer des améliorations ou encore mieux...des patchs :-)

Edit : Pour une installation et utilisation rapide, j'ai fais [une petite doc dans la partie OpenVZ de mon wiki](http://wiki.deimos.fr/OpenVZ_:_Mise_en_place_d%27OpenVZ#Ajustement_automatique_des_limites)
