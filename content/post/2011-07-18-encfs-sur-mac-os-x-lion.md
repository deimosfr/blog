---
title: Encfs sur Mac OS X Lion
author: Deimos
type: post
date: 2011-07-18T05:21:36+00:00
url: /2011/07/18/encfs-sur-mac-os-x-lion/
categories:
  - Hi-Tech
  - Mac
tags:
  - Hi-Tech
  - Mac

---

J’ai eu quelques petits soucis en arrivant sur Lion pour avoir Encfs :


* J'ai dû chopper une bêta XCode et l'installer
* Ce Xcode m'a été nécessaire pour installer MacPort. Qui lui n'était pas encore packagé Lion, j'ai donc du recompiler les sources depuis le SVN
* J'ai pu mettre à jour tous mes ports dont Encfs et Macfuse

Seulement voilà, même en mettant tout ce petit monde à jour, impossible de monter mon dossier crypté ! Voilà l'erreur :

> /Library/Filesystems/fusefs.fs/Support/fusefs.kext failed to load * (libkern/kext) requested architecture/executable not found; check the system/kernel logs for errors or try kextutil(8).
  
> the MacFUSE file system is not available (71)
  
> fuse failed.  Common problems:
  
> * fuse kernel module not installed (modprobe fuse)
  
> * invalid options - see usage message

Il semblerait que ce soit depuis la version 10.6.7 d'OSX, le problème existe. La solution est donc de prendre cette version de macfuse qui ne fait pas partie des macport : <http://www.tuxera.com/mac/macfuse-core-10.5-2.1.9.dmg>

J'ai pu voir également que MacFuse n'était plus mis à jour depuis un moment (considéré comme mort même pour certains) et qu'un autre projet était né pour le remplacé appelé [Fuse4x (http://fuse4x.org)](http://fuse4x.org/) qui lui est 64 bits. Je n'ai pas eu le temps de le tester pour le moment.

Ressources :
  
* https://trac.macports.org/ticket/29917
  
* [https://github.com/mxcl/homebrew/issues/6385](https://github.com/mxcl/homebrew/issues/6385)
