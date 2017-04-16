---
title: Vous connaisser loserman ?
author: Deimos
type: post
date: 2010-06-28T06:00:54+00:00
url: /2010/06/28/vous-connaisser-losserman/
categories:
  - Hi-Tech
  - Others
  - Private life
tags:
  - Hi-Tech
  - Others
  - Private life

---
Moi je connais un mec qui ce week end a fait un petit reboot (pour simplifier la situation) de son serveur qu’il a chez lui. En faisant le reboot 2 disques de sont raid 5 sont endommagés (1 qui fait clic clic et l’autre visiblement le problème de firmware Seagate….il avait pourtant flashé à l’époque pour ne pas que ça arrive).

Il essaye donc d'en faire repartir 1 et par miracle il y arrive. 2 h après (le temps d'aller acheter des disques), il revient sauf que 5 min avant c'était trop tard. Le disque qui était de nouveau down. Au final il perdit toutes ses VMs, avec ses confs et autres babioles...3To.
  
Heureux de sa journée, il décide alors d'en profiter pour être plus écolo et décide de refaire son serveur sur un mac mini qui ne consomme pas grand chose. L'EFI étant l'ami de tous, il passe beaucoup de temps pour arriver à un résultat médiocre...en gros ça fonctionne mais il est obligé de garder une partition hfs+ sinon il ne peut booter sur Linux. Après une journée, il se dit que c'est pas la peine, qu'il verra plus tard. Que le plus important c'est de refaire fonctionner les mails et les sites web.

Il se dit qu'il va reconstruire le raid de son ancien serveur et recommencer...il tente...mais la courte nuit ne l'aide pas et se tape un écran défilant et hurlant que le raid 5 est capoute. N'arrivant pas à reprendre facilement la main et après une bonne dose de week-soulage, il décide de passer à sa dedibox.
  
Il tente alors de faire rapidement un serveur mail. Celui fonctionne visiblement mais est d'une belle lenteur. De la fumée commence à sortir de ses oreilles...

De colère, il décide de faire la gestion de ses DNS sur gandi et se dit "vas y fais chier, je passe sur google le temps que je me refasse un serveur digne de ce nom...et puis avec le déménagement, ça évitera encore un downtime).
  
Ni une ni deux, il passe sur google apps pour gérer ses domaines. Seulement la petite subtilité, c'est qu'il ne faut même pas penser à avoir un compte groupé ou encore une gestion multi domaines avec la version standard. De même, il est impossible depuis ces comptes apps faire des transfert.

Cet homme est à ce moment là à 2 doigts de commettre la boulette ! Il tente le tout pour le tout, refait ses DNS chez gandi (gérer donc par gandit) et utilise les redirections standard de gandi. Le lendemain matin après une bonne nuit de sommeille tout fonctionne.

Cet homme est aujourd'hui soulé de ce qu'il lui est arrivé, réfléchira à une solution de backup de porc pour ne plus que ça lui arrive. Il la communiquera également.

Pour conclure, ce qui le fait plus chier dans l'histoire c'est d'avoir perdu des heures de conf alors que dans la semaine il avait tout préparer pour les envoyer sur amazon S3 mais n'avais juste pas eu le temps de mettre la ligne magique dans la crontab.

Cet homme se dit qu'une nouvelle semaine commence et qu'il va falloir repenser certains trucs.

PS: pour les vifs d'esprit qui ne l'auraient pas compris, looserman, c'est moi
