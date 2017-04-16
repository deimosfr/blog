---
title: Upgrader la RAM de vos Mac, plus que possible
author: Deimos
type: post
date: 2013-03-29T11:00:51+00:00
url: /2013/03/29/upgrader-la-ram-de-vos-mac-plus-que-possible/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Mac
  - Virtualization

---
![debian_logo](/images/logo_debian.png)
Il y a quelques années, j'avais [déjà fait un upgrade](http://blog.deimos.fr/?p=337) de [mon Mac Mini qui me sert aujourd'hui de serveur](http://blog.deimos.fr/?p=985).

Maintenant, je commence a avoir de nouveaux besoins, nécessitant de plus en plus de ressources. J'avais déjà quelques problèmes d'I/O, ce qui m'a pousser à prendre un SSD et un besoin de plus des 4 Gb de mémoire installés. En parcourant la documentation de mon Mac mini, la taille maximale annoncée est de 4Gb. Pourtant un petit dmidecode en dit un peu plus long :
  
![debian_logo](/images/logo_debian.png)

Il y a quelques années, j'avais [déjà fait un upgrade](http://blog.deimos.fr/?p=337) de [mon Mac Mini qui me sert aujourd'hui de serveur](http://blog.deimos.fr/?p=985).

Maintenant, je commence a avoir de nouveaux besoins, nécessitant de plus en plus de ressources. J'avais déjà quelques problèmes d'I/O, ce qui m'a pousser à prendre un SSD et un besoin de plus des 4 Gb de mémoire installés. En parcourant la documentation de mon Mac mini, la taille maximale annoncée est de 4Gb. Pourtant un petit dmidecode en dit un peu plus long :
  
` 
  
Oh ohhhhh !!!!! 32 Gb !!!! Bon alors on se calme ! C'est pas parce que la carte mère peut techniquement les supporter, que les slots/bus sont capable de le faire.
  
J'ai alors cherché sur le net et je suis tombé sur le site d'[OWC](http://eshop.macsales.com/item/Other%20World%20Computing/8566DDR3S8GP/) qui a produit des tests et qui certifie que les barrettes que vous allez acheter vont fonctionner dans votre mac.

Ca m'a donc permis de passer de 4Gb à 8Gb et ça marche nickel :-). Je vais donc pouvoir lancer plus de VMs KVM sur ma Debian.