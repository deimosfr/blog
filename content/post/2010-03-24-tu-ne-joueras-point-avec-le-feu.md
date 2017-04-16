---
title: Tu ne joueras point avec le feu !
author: Deimos
type: post
date: 2010-03-24T11:05:15+00:00
url: /2010/03/24/tu-ne-joueras-point-avec-le-feu/
categories:
  - Developement
  - Hi-Tech
  - Windows
tags:
  - Developement
  - Hi-Tech
  - Windows

---

Dans un précédent post, j’expliquais comment faire des exe sous Windows. Je vais donc expliquer pourquoi :

Dans ma boite, j'ai des personnes mal intentionnées qui avaient les droits admin de leur machine. Le problème c'est qu'avec ça ils peuvent en faire des conneries...

Pour palier à ce problème, on les a mis en utilisateurs. Et pour ne pas que si quelqu'un trouve le mot de passe admin, qu'il puisse se connecter sur n'importe quel ordinateur pour prendre des informations, il faut un mot de passe unique par ordinateur.

J'ai donc développé un outil en Perl permettant de récupérer le numéro de série de la machine, de concaténer celui ci avec un mot de passe ou phrase unique (qui ne doit jamais changer), créer un hash de cette concaténation, puis récupérer les x premiers caractères qui correspondront au mot de passe admin de la machine.

Ceci a pour avantage d'avoir un mot de passe unique par machine et de pouvoir récupérer ce mot de passe juste en exécutant cet exe sur la machine. Par expérience, je sais que ce .exe arrivera un jour ou l'autre a se balader sur le réseau c'est pourquoi j'y ai ajouté 2 petites sécurités :

  * Un mot de passe principale pour afficher le mot de passe admin
  * Une suppression automatique de ce .exe après exécution.

J'ai donc écrit ceci en Perl puis ai compilé un exécutable. Pour ceux que ça intéresse, [voici la documentation](http://wiki.deimos.fr/Cr%C3%A9er_des_mots_de_passe_Administrateurs_unique_par_poste).
