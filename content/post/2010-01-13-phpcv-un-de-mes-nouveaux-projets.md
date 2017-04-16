---
title: 'phpCV : Un de mes nouveaux projets'
author: Deimos
type: post
date: 2010-01-13T06:42:49+00:00
url: /2010/01/13/phpcv-un-de-mes-nouveaux-projets/
categories:
  - Developement
  - Private life
tags:
  - cv
  - dev
  - pdf
  - php
  - phpcv
  - wkhtmltopdf

---

J’ai récemment décidé de passer un VAE pour me faire valider un BTS. Pour ça, on me demande un CV. CV que j’ai mis à jour il y a quelques temps déjà et j’en avais parlé dans des billets précédents sur ce blog (-> http://www.mavro.fr).

J'utilise donc le superbe [Sample Resume Template][1] qui en fait est une template HTML. Il faut donc faire pas mal de changements pour arriver à un résultat convenable. Mais au final c'est beau et class.
  
Pour ma part, je voulais faire une version Français et Anglaise de mon CV. Seulement certaines parties se répètent et je n'ai ni envie de réécrire les mêmes choses, ni l'envie de rentrer dans du code a chaque fois que je veux modifier un petit truc.

Il y avait quelques temps, j'avais parlé d'un projet [phpWOL][2] qui nécessitait que j'ai quelques connaissances en PHP, voilà qui est maintenant chose faite avec phpCV puisque j'ai pu :
  
* Rendre le code modulaire (HTML -> PHP) afin de rajouter des infos plus facilement
  
* Gérer du bi langages
  
* Gérer une partie privée (a ne pas afficher sur le web par exemple tel que numéro de téléphone etc..., mais pouvoir l'afficher à la demande)
  
* Générer un PDF à la volée
  
* Affichage de l'age et année a la volée

Voilà, la version 0.1 devrait pas tarder à voir le jour, mais je rencontre un petit soucis avec l'outil que j'utilise pour faire du PDF. En effet, j'utilise [wkhtmltopdf][3]. Dans une version antérieur, ça fonctionne nickel mais nécessite un serveur X (abusé) et dans la dernière version, c'est nickel sauf un bug sur un bout de CSS qui fait que le titre est complètement décalé (mais plus besoin du serveur X). J'ai envoyé un mail à l'auteur, mais il ne sait pas d'ou vient le bug et ça n'a pas l'air d'être dans ses priorités :-(.

Je vais donc essayer de trouver une alternative en attendant la correction du bug pour pouvoir releaser sur mon git dans un premier temps pour ceux que ça intéresserait.

 [1]: http://sampleresumetemplate.net/
 [2]: http://blog.deimos.fr/?p=365
 [3]: http://code.google.com/p/wkhtmltopdf/
