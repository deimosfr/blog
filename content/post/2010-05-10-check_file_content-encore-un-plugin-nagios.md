---
title: 'Check_file_content : encore un plugin Nagios'
author: Deimos
type: post
date: 2010-05-10T19:46:46+00:00
url: /2010/05/10/check_file_content-encore-un-plugin-nagios/
categories:
  - Developement
  - Hi-Tech
  - Nagios
tags:
  - Developement
  - Hi-Tech
  - Nagios

---

Me voilà reparti dans mes plugins nagios. J’ai dû développer ça pour le taf à la base et je me suis dis que j’allais le rendre générique et le présenter à la communauté :-)
 
Voilà donc un plugin qui permet de parser un fichier, et de garder ou non les lignes qui nous intéressent. En plus de celà on peut spécifier, s'il faut un certain nombre de lignes pour que le plugin retourne une valeur positive.

J'en entend d'ici dire : "Bah ça sert à rien ton truc, on fait un cat, un grep, un grep -v et un wc, le tout pipé (paillepé ;-))". Je dis oui, mais seulement....allez balancer votre bouzin sur des fichiers de quelques gigas voir plus, vous verrez qu'est-ce qui est plus rapide !

Voici les liens :
  
* [Sur mon git][1]
  
* [Sur le site officiel de nagios][2]

 [1]: http://www.deimos.fr/gitweb/?p=nagios_plugins.git;a=tree;f=check_file_content;h=c4aed2bb96d65c7fe1e7dd6b5bd50c9cd8144412;hb=HEAD
 [2]: http://exchange.nagios.org/directory/Plugins/Log-Files/Check-File-Content/details
