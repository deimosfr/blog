---
title: Remplacer VirtualBox par KVM sur son desktop
author: Deimos
type: post
date: 2013-03-19T11:00:33+00:00
url: /2013/03/19/remplacer-virtualbox-par-kvm-sur-son-desktop/
image: /images/logo_kvm.png
thumbnailImage: /thumbnails/logo_kvm.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Virtualization

---
![Kvm-logo](/images/logo_kvm.png)
KVM, quel merveilleux hyperviseur ! Je l'utilise depuis plusieurs années sur mes serveurs et je commence a l'utiliser sur ma workstation pour plusieurs raisons. Je vais comparer KVM a l'outil de virtualisation gratuit, a la mode : VirtualBox. Voici les raisons qui me poussent a passer a KVM :

  *  **La licence** : VirtualBox c'est bien, mais si je peux éviter toute dépendance avec Oracle, c'est mieux ! Je n'ai pas envie de connaître a fond une techno propriétaire qui peut d'un jour a l'autre basculer de gratuite à payante (faut pas oublier que c'est Oracle hein !)
  *  **Le mode headless** : sur VirtualBox on peut choisir de faire démarrer une VM avec ou sans fenêtre. Le problème c'est que si vous choisissez de démarrer sans fenêtre, il faut prévoir la prise en main via RPC ou de redémarrer la VM avec la prise en charge de la fenêtre. Sur KVM, on s'en fout, par défaut, pas besoin de cet artifice. On démarre sans fenêtre et on se connecte dessus quand on veut et sans reboot.
  *  **La prise en main a distance** : les 2 se vallent je trouve, même si j'ai une préférence pour KVM qui va utiliser un protocole plus libre (VNC) que l'autre (RDP). De plus, il existe Splice sur KVM, qui permet à la manière de citrix d'avoir des fenêtre déportées optimisées. Mais là, côté VirtualBox...rien de ce genre.
  *  **L'arrêt des guests** : rebooter votre host sur VirtualBox, vous allez kiffer ! Vos VM s'éteignent a l'arrache !!! Pas de gentil petit ACPI ou autre solution pour demander a vos guests de s'éteindre proprement. KVM est bien packagé et arrive avec tout ce qu'il faut en standard pour gérer ceci. Par défaut les VMs ont 5 min pour s'éteindre. Cerise sur le MacDo, vous pouvez même demander un suspend a la place.
  *  **La portabilité** : le multi OS n'est clairement pas le fort de KVM qui n'est fait que pour Linux. Mais bon...un qcow2 ça se converti en n'importe quoi, donc...ça me va quand même, bien que VirtualBox marque des points la dessus.
  *  **Les performances** : virtio explose littéralement VirtualBox. Sous KVM, les VMs ronronnes avec ce genre de drivers paravirtualisés.
  *  **L'évolution** **des VMs** : on ne peut pas dire que même si KVM n'est pas portable (multi OS nativement), il n'a d'intérêt que pour sa petite personne. Aujourd'hui de nombreux projets (et pas des moindres) utilisent KVM tel que oVirt (RedHat) ou OpenStack. Passer une VM, de son desktop, a ce type de solutions serveurs, devient alors triviale.
  *  **Les fonctionnalités** : aujourd'hui VirtualBox dispose d'un peu plus de fonctionnalités que KVM, c'est vrai ! Mais pour un desktop, a t'on vraiment besoin de tout un tas de features (useless diront certains), je ne pense pas...en tous cas ça ne m'handicape pas au quotidien.
  *  **La taille** : installer VirtualBox c'est quand même super lourd comparé a KVM qui est déjà intégré au noyau. C'est vrai qu'il faut la partie QEMU, mais ça reste tout de même très léger (toujours en comparaison hein, c'est un hyperviseur quand même).

J'espère avoir pu vous convaincre d'y passer ou au moins d'essayer. Au boulot j'arrive a convertir mes collègues. Il suffit de leurs montrer la prise en mains de VMs avec Virt-Manager sur leurs machines pour les faire cogiter.

Si je ne suis par exemple pas là, juste en allumant ma machine, ils peuvent avoir accès a mon hyperviseur facilement et jouer avec les VMs. Cette souplesse est importante lorsque l'on travaille en équipe.

Maintenant...a vos hyperviseurs :-)