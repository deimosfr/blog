---
title: Multiplexer SSH et SSL
author: Deimos
type: post
date: 2010-05-14T13:13:41+00:00
url: /2010/05/14/multiplexer-ssh-et-ssl/
categories:
  - Hi-Tech
  - Linux
  - OpenBSD
  - Security
tags:
  - Hi-Tech
  - Linux
  - OpenBSD
  - Security

---

[SSLH][1] est comme un tour de magie. Il permet par exemple sur une adresse WAN sur le port 443 d’avoir du HTTPS et du SSH. Comment c’est possible ??? On peut mettre un même port d’écoute sur un même port !

Effectivement ! Il faut simplement voir SSLH comme un proxy de couche 7 capable de filtrer et différencier les trames SSL des trames SSH. 

[Et voici une petite documentation et un correctif pour OpenBSD][2].

 [1]: http://www.rutschle.net/tech/sslh.shtml
 [2]: http://wiki.deimos.fr/SSLH_:_Multiplexer_les_connections_SSL_et_SSH_sur_le_m%C3%AAme_port
