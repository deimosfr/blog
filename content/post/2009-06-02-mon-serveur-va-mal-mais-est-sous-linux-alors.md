---
title: Mon serveur va mal, mais est sous Linux alors…
author: Deimos
type: post
date: 2009-06-02T05:23:20+00:00
url: /2009/06/02/mon-serveur-va-mal-mais-est-sous-linux-alors/
categories:
  - Hi-Tech
  - Others
tags:
  - Hi-Tech
  - Others

---

Hier soir, je rentre et ma femme me dit : “Tu tombes bien, ça fait 2 min que ton serveur fait un bruit bizzard”. Et franchement entre la musique de ses Sims (dont la maison prenait feu) et le serveur, j’avais du mal à distinguer le bruit du serveur tellement c’était la première fois que j’entendais ce bruit là.

Une fois le son des Sims coupés (:-p) j'étais ennuyé parce que le bruit ne me disait vraiment pas grand chose. J'ai donc tendu l'oreille et pensais que c'était un ventillateur défecteux à première vue. J'ai donc éteint la machine, retirer le ventillo, puis redémarré. Et là, plus de bruit. Je pensais donc mon problème réglé.

Dans la nuit, vers 1h du mat, le bruit ressurgit et nous réveille tous. Je retends a nouveau l'oreille (la nuit ça devient tout de suite vite chiant lol) et je me rends compte que c'est un des disques dur qui fait ce bruit là. Pour rappel je tourne avec 1 disque sur l'OS et 4 disques en RAID 5. Je prie donc que ce ne soit pas le disque de l'OS qui pose problème, mais un des disques de la grappe du RAID 5.

Seulement voilà, le seigneur ne m'a point entendu à 1h du matin (certainement couché lui aussi). C'était donc le disque où il y avait l'OS qui fautait le bordel. Je le débranche donc à chaud (merci SATA2 et puis aussi parce que c'était la nuit et que yen avait marre) puis regarde rapidement comment se comporte la bête.

Et bah disque ou pas disque, ya pas grande différence. Jugez par vous même, je suis en train d'écrire ces lignes sur mon blog situé sur mon serveur et ça ne l'inquiète pas plus que ça. Mes VMs étant stockées sur le RAID 5, tout le reste continue à tourner sans trop se poser de question à priori. Je trouves ça quand même magique ! L'OS n'existe plus, mais tout continue à tourner !

Alors bon si, petit bémol quand même, je ne peux plus me logger sur la machine hôte ! Je ne peux même pas redémarrer, mais l'avantage c'est que tous les services tournent et ça, je trouve ça vraiment impressionnant ! C'est pas Windows qui nous emmènerais jusque là.
  
Alors bon, j'entends déjà des voix dire (bah oui mais c'est chargé en RAM alors c'est normal nia nia nia...). Oui peut être, mais le constat est là !

Maintenant, j'ai un dd qui tourne pour cloner le disque défectueux sur un autre disque. J'espère que ce sera terminé avant que je parte au taf, que je puisse lancer quelquechose de propre quand même.

Bref, Linux c'est trop puissant !
