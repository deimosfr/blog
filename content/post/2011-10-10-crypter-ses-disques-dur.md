---
title: Chiffrer ses disques dur
author: Deimos
type: post
date: 2011-10-10T19:10:35+00:00
url: /2011/10/10/crypter-ses-disques-dur/
categories:
  - Hi-Tech
  - Security
tags:
  - Hi-Tech
  - Security

---

Cela fait longtemps que je crypte mes données avec [ENCFS][2] et j’en suis très satisfait, même si les performances ne sont pas au rendez vous (fuse). Il existe Luks (celui qui a dit skywalker sort) qui est intégré au noyau et qui est bien plus performant. Je pense qu’il est tout aussi fiable (pas testé sur du long terme, mais natif à Red Hat).

Pour ceux que ça intéresse, j'ai donc concocté comme à mon habitude une [petite documentation sur Luks][1].

 [1]: https://wiki.deimos.fr/Luks_:_Chiffrer_ses_partitions
 [2]: https://wiki.deimos.fr/Encfs_:_Mise_en_place_d%27Encfs_avec_FUSE
