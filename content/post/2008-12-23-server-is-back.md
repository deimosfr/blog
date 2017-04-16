---
title: Server is back !
author: Deimos
type: post
date: 2008-12-23T14:24:15+00:00
url: /2008/12/23/server-is-back/
categories:
  - Linux
tags:
  - Linux

---

Et bien me voilà de retour. Bon tout est loin d’être terminé, mais je sais où je vais maintenant. Voici donc ce qui a été fait :

* Le serveur tourne maintenant sous Solaris en ZFS sur le disque primaire
  
* Sur les 4 autres disques de 1To, il y a un Raidz (ça trace sa maman)

* OpenBSD sous VirtualBox comme frontal a été abandonné. Pourquoi ? Bein, c'est soit disant supporté, mais je me tapes tout le temps des **Segmentation Fault**. Donc là forcément ca bloque, impossible de faire des compilation sans ces putains d'erreurs.
  
"j'ai donc pris la décision, et m'y engage personnellement" (dixit Sarko) à mettre en place une boiboite avec OpenBSD. Mais comment tu vas faire Pierre ? Mais comment ? Et là youpi tralala, voilà jumping from my hat la [Soekris][1]. Pour ceux qui ne connaissent pas, c'est tout simplement une archi i386 de 500Mhz (tout du moins la Soekris que j'ai prise) avec 512Mo de Ram, j'ai pris en + une carte PCI avec 4 emplacements ethernet supplémentaire, ainsi qu'une carte CompactFlash de 16Go pour mettre l'OS dessus (et oué, ca risque de booter en * de 5 sec). Je vous tiendrais au courant quand je recevrais la bête !

* J'ai finalement décider de passer sur Ubuntu Server. J'ai donc une VM pour toute ma partie multimédia (MediaTomb pour la PS3 etc...) et une VM de DMZ avec le serveur de mail et web. Tout n'est pas encore terminé, j'essaye de refaire toutes mes confs pour les paufiner et les optimiser plus.

Là j'avoue que j'en ai un peu marre donc je vais calmer le jeu. Si il y a des choses qui ne fonctionnent pas encore, ne vous inquiétez pas, c'est normal.

Sinon pour toutes les tuiles sur lesquelles je suis tomber, voici les solutions :
  
* [J'ai donc eu un problème de cartes réseaux qui ne voulaient pas être reconnu de base][2]
  
* [J'ai eu besoin de plusieurs options pour le ZFS (raidz, partage NFS etc...)][3]
  
* [Activer le NFS sur Solaris][4]
  
* [Tous les problèmes de merde lié à VirtualBox][5]
  
* [Un petit point que j'avais oublier dans ma doc de la config réseau Solaris. En effet, il ne faut pas oublier nsswitch.conf et une petite astuce pour la détection des cartes réseaux souvent un peu pénible.][6]

Enfin voilà. Je ne regrettes pas d'avoir fais cette migration. Je suis un peu déçu par VirtualBox :
  
* Pas de Full Virtualisation à + d'un guest (donc pas plusieurs guest 64 bits)
  
* Bugs à gogo, c'est bien pour une machine de bureau pour faire des tests, mais pas trop pour un serveur (tout dépends de ce que l'on fait avec hein).

J'attends donc avec impatience xVM Server, en espérant qu'ils nous fassent pas le coup de "On vous a bien fait attendre et c'est payant" parceque je serais vraiment véner.

Voilà, bon, j'vais me faire un petit Moto GP

 [1]: http://www.soekris.com/
 [2]: http://wiki.deimos.fr/Faire_reconnaitre_des_cartes_r%C3%A9seaux_non_support%C3%A9es_par_Solaris
 [3]: http://wiki.deimos.fr/ZFS_:_Le_FileSystem_par_excellence
 [4]: http://wiki.deimos.fr/NFS_:_Mise_en_place_d%27un_serveur_NFS#Solaris
 [5]: http://wiki.deimos.fr/VirtualBox_:_Alternative_%C3%A0_Vmware#FAQ
 [6]: http://wiki.deimos.fr/Configurer_le_r%C3%A9seau_sur_Solaris
