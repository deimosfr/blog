---
title: Ubuntu – Copier coller avec MX Revolution
author: Deimos
type: post
date: 2009-05-10T09:37:44+00:00
url: /2009/05/10/ubuntu-copier-coller-avec-mx-revolution/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

Depuis la version 8.10 d’Ubuntu, ma souris Logitech Revolution ne fonctionne plus comme avant. J’essaye donc de retrouver le petit petit à petit ce qui me manque. En gros :

* La sélection de texte qui copie automatiquement dans le presse papier (clipboard)
  
* Le bouton gauche de la souris qui effectue un coller du clipboard

Et bien ces 2 trucs là, je galère depuis longtemps à les retrouver et je pensais enfin avoir réussi.
  
Pour le bouton gauche, il faut utiliser BTNX et pour le texte qui se copie à la sélection xclip.
  
Mais tout ça n'est pas aussi simple que ça et avec une souris standart 3 bouttons, tout marche parfaitement.

C'est donc que tout est installé de base sans avoir besoins de rajouter des trucs supplémentaires. Et par chance, voici la solution :

{{< highlight bash >}} 
xmodmap -e "pointer = 1 8 3 4 5 6 7 2 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32"
{{< /highlight >}}

J'ai trouvé la réponse [sur le forum d'ubuntu][1].

Pour ceux qui sont habitués à mon wiki, [il y a même un petit lien ici][2].

 [1]: http://ubuntuforums.org/showthread.php?t=1115227
 [2]: http://wiki.deimos.fr/Xmodmap_:_mapper_tous_les_boutons_de_sa_souris
