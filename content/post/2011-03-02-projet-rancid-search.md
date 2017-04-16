---
title: 'Projet : Rancid Search'
author: Deimos
type: post
date: 2011-03-02T06:30:47+00:00
url: /2011/03/02/projet-rancid-search/
image: http://wiki.deimos.fr/images/b/b8/Rancidsearch_logo.png
categories:
  - Developement
  - Hi-Tech
  - Security
  - Web
tags:
  - Developement
  - Hi-Tech
  - Security
  - Web

---
![Rancidsearch_logo](http://wiki.deimos.fr/images/b/b8/Rancidsearch_logo.png)
</h1>

Revoilà encore un nouveau projet. Il s'agit de Rancid Search.
  
Vous connaissez déjà peut être [Rancid][1] qui permet de faire des backups de vos chers équipements Cisco et de les stocker dans un [VCS][2]. Au taf, mon équipe réseaux se plaignait de ne pas pouvoir faire de recherche dans tous les équipements cisco d'un coup. Imaginez plusieurs équipements avec pour certain plus de 25000 lignes d'ACL et autre configuration VPN. Pour faire des recherches, il fallait déjà savoir sur quelle équipement se connecter, puis chercher dans la conf. Bref, un travail pas toujours évident en lecture, long et sans recherche de regex.

J'ai donc décidé de leur fabriquer une interface web répondant a leur besoin avec l'aide d'un collègue. L'interface est en Perl CGI dans laquelle j'utilise du Jquery pour des trucs "mode kéké" ou encore Web 2.0, mais c'est joli :-)

Pour le moment, vous pouvez trouver la version actuelle sur [mon Git][3]. Je dois mettre ce projet sur Sourceforge, faire un petit README, lister les features etc... Je vous dirais ça très bientôt.

J'espère que cet outil sera enrichi par des tiers et servira a d'autres personnes. N'hésitez pas à donner vos premières impressions.

 [1]: http://www.shrubbery.net/rancid/
 [2]: http://wiki.deimos.fr/Serveurs#Versionning
 [3]: http://www.deimos.fr/gitweb/