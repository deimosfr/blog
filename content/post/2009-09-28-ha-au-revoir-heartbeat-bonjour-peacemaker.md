---
title: 'HA : Au revoir Heartbeat, bonjour Peacemaker'
author: Deimos
type: post
date: 2009-09-28T16:40:36+00:00
url: /2009/09/28/ha-au-revoir-heartbeat-bonjour-peacemaker/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

François un de mes collègues, m’a apprit aujourd’hui que Heartbeat n’était plus maintenu depuis l’année dernière et qu’ils avaient décidés de merger avec Pacemaker pour avoir un produit encore plus abouti.

[Pacemaker](http://clusterlabs.org/wiki/Main_Page) est en fait un espèce de Heartbeat 3 (trouvé sur la doc officelle) avec comme framework OpenAIS qui est en fait une librairie pouvant être appellée via API. Un peu à la manière de KVM/Xen et [libvirt](http://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM).

C'est donc une mode et ça nous replonge encore dans du temps passer à lire et lire des docs. Malheureusement le temps n'est pas illimité :-(. Donc si quelqu'un avait une belle doc **rapide** sur Debian stable avec ces beaux jouets, je suis preneur !

En attendant c'est sur que ce genre de schéma fait rêver :

<p style="text-align: center;">
![Pacemaker-n-to-n](/images/Pacemaker-n-to-n.png)
