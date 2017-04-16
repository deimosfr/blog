---
title: Fonts powerline
author: Deimos
type: post
date: 2013-04-08T10:00:21+00:00
url: /2013/04/08/fonts-powerline/
image: /images/powerline.png
thumbnailImage: /thumbnails/powerline.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![powerline](/images/powerline.png)
Depuis quelques temps, je refais quelques configuration vieillissantes pour les mettre au goût du jour. Entre autre, j'ai découvert par un collègue, les polices Powerline. Et j'ai kiffé. Comme le montre le screeshot ci dessus, ça nous fait des espèces de flèches jolies. Si je ne dis pas de bêtises, l'origine de ceci est un module pour Vim et aujourd'hui on commence à voir apparaître plusieurs outils utilisant ces powerlines. Je vous présenterais les miens dans les prochains jours.

Donc pour se récupérer ces fonts powerline, dont [Dina](http://blog.deimos.fr/2013/02/01/dina-une-police-pour-developper/) que je vous avait présenter il y a quelques temps. Voici quelques liens intéressants :

  * Dina Powerline (Merci VimNinja) : [https://github.com/tampix/Dina-Powerline](https://github.com/tampix/Dina-Powerline)
  * Autres fonts Powerline : [https://github.com/Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts)

Pour les faire fonctionner, insérez les dans ~/.fonts, puis lancez ces commandes :

{{< highlight bash >}}
cd ~/.fonts
mkfontscale
mkfontdir
fc-cache -f -v
{{< /highlight >}}

J'ai également mis à votre disposition mes fonts Powerline sur mon git, ainsi qu'un script pour générer les fichiers nécessaire à leur fonctionnement : [http://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/fonts](http://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/fonts)
