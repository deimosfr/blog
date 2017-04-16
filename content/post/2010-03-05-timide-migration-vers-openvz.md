---
title: Timide migration vers OpenVZ
author: Deimos
type: post
date: 2010-03-05T06:41:25+00:00
url: /2010/03/05/timide-migration-vers-openvz/
categories:
  - Hi-Tech
  - Linux
tags:
  - Linux
  - VIrtualisation

---

J’ai eu un commentaire disant que les posts se faisaient rare ces temps ci alors en voilà un :-).

Actuellement sur mon serveur, je tourne avec [KVM et libvirt][1]. J'en suis plutôt très satisfait. Seulement voilà, entre MySecureShell avec lequel on doit compiler sur beaucoup de plateformes et mes autres VM dont j'ai besoin au quotidien, les 4Go de RAM de la machine ne suffisent pas forcément et je suis au maximum des capacités RAM sur celle ci.

Sachant que la plupart de mes VM tournent sur Debian, il est un peu idiot de virtualiser du debian sur du debian alors qu'un jail like suffirait. Au début j'avais pensé à VServer. Mis à part les problèmes réseaux en grande charge, ça fonctionne plutôt pas mal. Seulement voilà, il y a quelques temps, je lis que pour la prochaine version de Debian, il n'est plus possible de compter dessus.

Que reste t'il ? OpenVZ ! Ca fait déjà facile 3 ans que j'en entends parler, mais son intégration n'étant pas aisée dans Debian 4 ne m'avait à l'époque pas séduit. C'est le cas dans Debian 5 et le sera dans Debian 6. Donc je me suis lancé au boulot dans un premier temps et ça marche plutôt très bien et je n'ai pas les problèmes réseaux comme j'ai pu avoir avec Vserver.

Dommage que l'intégration avec libvirt ne se fasse pas encore nativement sur Debian (j'imagine dans la prochaine version). Bref donc je pense migrer petit à petit mes VM de KVM sur OpenVZ et garder KVM pour le reste. Sachant que les 2 cohabitent très bien et qu'en plus (si je me sort les doigts du \***) on peut manager tout ce petit monde avec libvirt, ça serait royale !

La [documentation est faite depuis un moment pour OpenVZ][2], mais c'est surtout du côté des derniers ajouts que c'est intéressants. [Je vous laisse jetter un oeil][2].

 [1]: http://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM
 [2]: http://wiki.deimos.fr/OpenVZ_:_Mise_en_place_d%27OpenVZ
