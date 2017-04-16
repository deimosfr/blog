---
title: ZFS trop gourmand en RAM
author: Deimos
type: post
date: 2010-05-28T05:23:07+00:00
url: /2010/05/28/zfs-trop-gourmand-en-ram/
categories:
  - Hi-Tech
  - Solaris
tags:
  - Hi-Tech
  - Solaris

---

J’ai eu une petite mésaventure depuis quelques mois au taf avec ce merveilleux filesystem qu’est ZFS. Le problème est simple, j’ai des machines à 72Go de RAM et ne peut dépasser ~ les 48Go.

Comment ça se fait ? Tout simplement parce que ZFS se réserve 1/8 de la mémoire dispo (RAM+SWAP) pour son cache. Sur des petites config ça ne se voit pas mais sur des machines avec autant de RAM, ça ait mal.

Vous ne pouvez donc pas réserver de mémoire dans cette espace déjà réserver à ZFS. Vous pouvez seulement demander à en utiliser. Pour palier à ce problème, vous pouvez limiter la taille du cache ZFS. Personnellement je la limite à 4Go qui est déjà pas mal.

[Voici une doc][1] pour analyser l'état de votre mémoire afin de se rendre un peu mieux compte ou ces Go partent ainsi que le tuning ZFS.

 [1]: http://wiki.deimos.fr/ZFS_:_Le_FileSystem_par_excellence#Le_cache_ARC_ZFS
