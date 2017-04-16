---
title: Se servir du iPhone comme clef USB
author: Deimos
type: post
date: 2009-11-14T08:54:01+00:00
url: /2009/11/14/se-servir-du-iphone-comme-clef-usb/
categories:
  - Hi-Tech
  - iPhone
  - Linux
tags:
  - Hi-Tech
  - iPhone
  - Linux

---

Ca faisait un moment que je cherchais ça. Grace à iFuse, je peut monter mon iPhone sur mon Ubuntu, et m’en servir comme une clef USB et sans avoir besoin de le jailbreaker. Il faut pour ça installer un repository et lancer la commande magique :

{{< highlight bash >}}
sudo add-apt-repository jonabeck
sudo apt-get install ifuse
{{< /highlight >}} 
