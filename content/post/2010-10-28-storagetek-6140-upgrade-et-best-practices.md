---
title: StorageTek 6140 upgrade et best practices
author: Deimos
type: post
date: 2010-10-28T06:40:34+00:00
url: /2010/10/28/storagetek-6140-upgrade-et-best-practices/
image: /images/disk_array1.jpg
thumbnailImage: /thumbnails/disk_array1.jpg
thumbnailImagePosition: left
categories:
  - Hi-Tech
tags:
  - Hi-Tech

---
![disk_array1](/images/disk_array1.jpg)
J'ai récemment mis à jour une baie de disques Sun StorageTek 6140 de la version 6 à la version 7. La tâche n'était pas simple, il a fallu tout d'abord télécharger des outils spécifique pour effectuer cette upgrade :
  
[http://dlc.sun.com/pdf/820-7197-12/820-7197-12.pdf][1]

Ensuite, un collègue m'a filé ce lien qui permet d'avoir les best practice pour faire du RAID 6 :
  
<http://www.filibeto.org/sun/lib/blueprints/820-5825.pdf>

Tout ça pour faire du vmware. Il a donc fallu changer le mode de visualisation de la baie par les hosts en vmware et idem encore utiliser les recommandations de Vmware par rapport aux LUN etc... :
  
<http://download3.vmware.com/vmworld/2006/adc0051.pdf>

Mais un problème de performance déjà vu sur 2540 (la ptite soeur de la 6140) nous a montré de gros problèmes de performances aléatoire. La solution était tout simplement de retirer le mapping de la LUN 31 (LUN dédiée à la baie et présente par défaut sur les versions 6.x du firemware) :
  
<http://www.lukedarby.co.uk/?p=186>

 [1]: http://download.oracle.com/docs/cd/E19780-01/820-7197-12/820-7197-12.pdf