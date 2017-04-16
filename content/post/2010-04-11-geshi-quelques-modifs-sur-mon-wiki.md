---
title: 'GeSHi : Quelques modifs sur mon wiki'
author: Deimos
type: post
date: 2010-04-11T00:38:04+00:00
url: /2010/04/11/geshi-quelques-modifs-sur-mon-wiki/
categories:
  - Developement
  - Hi-Tech
  - Web
tags:
  - dev
  - Web
  - wiki

---

J’en ai eu marre de taper toujours et encore du code pour avoir de la numérotation de ligne commençant par 0 sur ma colorisation syntaxique de code avec GeSHi. En l’absence de documentation sur l’extension [SyntaxHighlight_GeSHi][1] j’ai du me farcir le code à la mainet trouver comment setter des valeurs par défaut. J’ai donc maintenant “line=1 start=0” à tous mes codes sur mon wiki sans me prendre la tête à l’écrire à chaque fois.

Pour ceux que ça intéresse, [j'ai fais un patch][2] à appliquer sur un des fichier de cette extension.

 [1]: http://www.mediawiki.org/wiki/Extension:SyntaxHighlight_GeSHi
 [2]: http://wiki.deimos.fr/Les_extentions_pratiques_de_Mediawiki#Syntax_Highlight_GeSHi
