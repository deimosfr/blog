---
title: Autossh sur un serveur de prod
author: Deimos
type: post
date: 2013-04-16T10:00:47+00:00
url: /2013/04/16/autossh-sur-un-serveur/
image: /images/logo_openssh.png
thumbnailImage: /thumbnails/logo_openssh.png
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
![Openssh_logo](/images/logo_openssh.png)
Alors oui je sais, c'est vraiment pas propre en prod, mais que voulez vous...on a pas toujours le choix, surtout quand on a pas la main sur l'infrastructure en question. J'ai eu besoin de mettre en place un tunnel SSH permanent (ce qui sous entends qu'il se reconnecte en cas de déconnexion), ça ne vous rappelle rien ? Un post que j'avais fait il y a quelques temps sur [AutoSSH][1].

J'ai remis le couvert et ai eu besoin de mettre cette connexion au boot. J'ai donc fait quelques ajustements et a [ajouté mes modifications sur mon wiki](http://wiki.deimos.fr/Autossh_:_reconnecter_automatiquement_un_tunnel_SSH#Au_boot). Je vous laisse jeter un oeil.

 [1]: http://blog.deimos.fr/2012/08/15/autossh-reconnecter-automatiquement-tunnel-ssh/ "AutoSSH : reconnecter automatiquement un tunnel SSH"