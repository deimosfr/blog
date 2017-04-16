---
title: Oh oui, c’est une belle journée, je vais me coucher…
author: Deimos
type: post
date: 2008-12-17T23:33:30+00:00
url: /2008/12/18/oh-oui-cest-une-belle-journee-je-vais-me-coucher/
categories:
  - Web
tags:
  - Web

---

ENFINNNNN, depuis le temps que je me prends la tête avec cette connerie. Mon wiki était super lent sous Firefox et seulement sous Linux. J’avais trouvé la cause qui était le thème Monobook de Mediawiki. Mais pourquoi moi et pas les autres sites ?

C'est en fait à cause du CSS mis en place pour Monobook. J'ai donc changer ceci :

{{< highlight css >}}
`/* Changer la couleur de fond des articles */<br />
.ns-0 * #content, .ns-0 * #p-cactions li, .ns-0 * #p-cactions li a {<br />
filter:alpha(opacity=90);<br />
-moz-opacity:.90;<br />
opacity:.90;<br />
/* Fin de la transparence*/`
{{< /highlight >}}
  
En cela :
  
{{< highlight css >}}
`/* Changer la couleur de fond des articles */<br />
.ns-0 * #content, .ns-0 * #p-cactions li, .ns-0 * #p-cactions li a {<br />
filter:alpha(opacity=90);<br />
}`
{{< /highlight >}}
  
Et c'est fini, ça ne freeze plus firefox. Ahhhhhh enfin....

[http://wiki.deimos.fr/MediaWiki:Installation\_et\_configuration#Affichage_Monobook][1]

 [1]: http://wiki.deimos.fr/MediaWiki:Installation_et_configuration#Affichage_Monobook
