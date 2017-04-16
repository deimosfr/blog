---
title: 'Mise à jour OpenBSD 4.5 -> 4.6 pas sans mal'
author: Deimos
type: post
date: 2009-10-25T19:44:20+00:00
url: /2009/10/25/mise-a-jour-openbsd-4-5-4-6-pas-sans-mal/
categories:
  - Hi-Tech
  - OpenBSD
  - Soekris
tags:
  - Hi-Tech
  - OpenBSD
  - Soekris

---

Vous l’avez peut être constaté, mais mon serveur était indisponible une partie de la journée. La faute à la mise à jour de ma OpenBSD sur ma Soekris qui a foirée. J’ai voulu upgrader comme j’avais fait à l’époque de la 4.4 vers la 4.5, à savoir en mode manuel http://www.openbsd.org/faq/upgrade46.html#upgrade.

Même si il est clairement spécifier que ce n'est pas la méthode recommandée, je n'avais pas rencontrer de problèmes la fois d'avant. Et là par contre, impossible de me connecter ! Ni en SSH, ni en port COM. Là tout de suite ça pique, je décide de [ressortir le kit du docteur][1].

Je boot donc via PXE, fait une upgrade par dessus la mienne foireuse. Un reboot et hop ça marche ! Youpi tralala, je fini donc en beautée par récupérer ma belle et m'en sort plutôt pas trop mal avec le merveilleux outil appelé [Sysmerge][2], que je n'avais pas utiliser lors de ma précédente update. Et il est vrai que c'est un petit bonheur (ok, ceux qui connaissent les joies d'apt, effectivement, on en est loin, mais c'est toujours mieux que rien).

Voici donc un petit listing des galères avec solutions que j'ai rencontré :
  
* Mon port série, j'aurais du noter la conf pour me connecter à la Soekris, [voici donc chose faite][3].
  
* Dans la documentation de mise à jour, il y a une erreur lors de la création des utilisateurs. Il faut mettre "g=uid" à la place de "g =uid" :

{{< highlight bash >}}  
useradd -u 95 -g=uid -c "SMTP Daemon" -d /var/empty -s /sbin/nologin _smtpd
useradd -u 96 -g=uid -c "rpc.rwalld" -d /var/empty -s /sbin/nologin _rwalld
{{< /highlight >}}  
  
* Packet Filer a aussi eu le droit à son upgrade avec le [remplacement de l'entrée "scrub in all" par "match in all scrub (no-df)"][4]

Et maintenant tout fonctionne :-)

 [1]: http://wiki.deimos.fr/Configuration_et_installation_via_port_s%C3%A9rie_d%27OpenBSD_sur_Soekris
 [2]: http://wiki.deimos.fr/Configuration_et_installation_via_port_s%C3%A9rie_d%27OpenBSD_sur_Soekris#Mise_.C3.A0_jour_d.27OpenBSD
 [3]: http://wiki.deimos.fr/Configuration_et_installation_via_port_s%C3%A9rie_d%27OpenBSD_sur_Soekris#Connexion_via_Minicom
 [4]: http://wiki.deimos.fr/Introduction_%C3%A0_Packet_Filter
