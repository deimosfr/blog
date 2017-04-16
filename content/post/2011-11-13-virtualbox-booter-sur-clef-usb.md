---
title: 'VirtualBox : Booter sur clef USB'
author: Deimos
type: post
date: 2011-11-13T11:00:11+00:00
url: /2011/11/13/virtualbox-booter-sur-clef-usb/
categories:
  - Hi-Tech
tags:
  - Hi-Tech

---
Voici une chose qui n’est visiblement pas disponible via la GUI de VirtualBox, c’est à dire, booter sur une clef USB !

Après quelques petites recherches, voici un moyen simple de créer un ".vmdk" bindé sur un raw device (la clef usb par exemple).

`Voici une chose qui n'est visiblement pas disponible via la GUI de VirtualBox, c'est à dire, booter sur une clef USB !

Après quelques petites recherches, voici un moyen simple de créer un ".vmdk" bindé sur un raw device (la clef usb par exemple).

` 

Il ne reste plus qu'à attacher ce vmdk à votre VM virtualbox et lui demander de booter dessus via la GUI.

Ca fonctionne très bien sur mac au passage. J'espère que l'astuce pourra servir à d'autres.
