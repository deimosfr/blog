---
title: MySecureShell sur Solaris
author: Deimos
type: post
date: 2009-11-13T21:26:30+00:00
url: /2009/11/13/mysecureshell-sur-solaris/
categories:
  - Hi-Tech
  - Linux
  - OpenBSD
  - Private life
  - Soekris
  - Solaris
tags:
  - Hi-Tech
  - Linux
  - OpenBSD
  - Private life
  - Soekris
  - Solaris

---

Je suis en train de bosser avec Seb sur la nouvelle mouture de MySecureShell. On a fait pas mal de chemin jusqu’à présent et je dois maintenant l’utiliser pour des besoins de productions dans la société dans laquelle je travaille, mais tournant sur Solaris.

Seb a du faire quelques ajustements rapide pour que ça tourne convenablement, mais certaines fonctionnalités ne fonctionne pas encore tout à fait bien. Bref, il travail dessus.
  
De mon côté, je me suis rendu compte que l'installation ne fonctionnait pas du tout, ni le sftp-verif. J'ai donc réécrit le tout en Perl. On va dire que pour le moment tout fonctionne à 95%.

Je suis en train de travailler sur la partie packaging pour pouvoir espérer une intégration au sein des packages CSW (blastwave).

En attendant, vous pouvez accéder aux sources qui permettent de faire fonctionner tout ça sur Solaris :-) : <http://sourceforge.net/projects/mysecureshell/develop>
