---
title: ZFS sur Linux
author: Deimos
type: post
date: 2011-03-24T11:16:29+00:00
url: /2011/03/24/zfs-sur-linux/
image: /images/logo_zfsonlinux.png
thumbnailImage: /thumbnails/logo_zfsonlinux.png
thumbnailImagePosition: left
categories:
  - FreeBSD
  - Hi-Tech
  - Linux
  - Others
  - Private life
tags:
  - FreeBSD
  - Hi-Tech
  - Linux
  - Others
  - Private life

---
![Zfs-linux](/images/logo_zfsonlinux.png)
Je suis actuellement en train de refaire un de mes 2 serveurs avec 5 disques sur lequel je souhaites la double parité et surtout un OS Linux car c'est ce que je connais de mieux pour la partie multimédia.
  
Aujourd'hui, je suis sous FreeBSD et je ne suis pas convaincu vu les bugs auxquels je me suis confronté (certainement du à l'émulation de couches basses Linux). Je me tourne donc vers [ZFS on Linux][1].

Je rajouterais à ceci une couche d'encryption disque avec [ENCFS][2]. Je testerais donc la compression ZFS pour minimiser l'espace supplémentaire occupé par l'encryption des données. Cependant je craint qu'avec seulement 5 disques avec du raidz2 je les satures rapidement si j'ai beaucoup d'activité dessus ou tout du moins si ils sont beaucoup sollicités (ex. la lecture d'un film en Full HD).

Pour ceux qui auraient du mal à se rendre compte de ce que ça donnerais, voici un schéma :

![zfsonlinux_encfs_deimos-300x174](/images/zfsonlinux_encfs_deimos-300x174.png)
  
Pour le moment, je suis assez satisfait de la maquette que j'ai monté. Tout à l'air de fonctionner correctement. Je testerais ce vendredi sur mon serveur finale et ferais un petit retour dans quelques temps (si je n'oublies pas ;-))

Ceux qui ont quelques retours d'expérience avec ZFS on linux, je suis preneur. Et pour les documentations c'est ici :
  
* [ZFS on Linux][1]
  
* [Utilisation du ZFS][3]
  
* [Encfs][2]

 [1]: http://wiki.deimos.fr/ZFS_On_Linux_:_Mise_en_place_de_ZFS_sous_Linux
 [2]: http://wiki.deimos.fr/Encfs_:_Mise_en_place_d%27Encfs_avec_FUSE
 [3]: http://wiki.deimos.fr/ZFS_:_Le_FileSystem_par_excellence