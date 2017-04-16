---
title: PAM mkhomedir sur Solaris
author: Deimos
type: post
date: 2009-10-05T11:43:13+00:00
url: /2009/10/05/pam-mkhomedir-sur-solaris/
categories:
  - Hi-Tech
  - Solaris
tags:
  - Hi-Tech
  - Solaris

---

Solaris n’intègre pas par défaut un mécanisme de création de dossiers personnels. Il faut donc utiliser PAM Linux, le compiler et copier la librairie qui va bien. Heureusement ça marche :-)

J'ai fais [une petite doc][1] pour ceux que ça intéressent.

 [1]: http://wiki.deimos.fr/PAM_:_Installer_pam_mkhomedir_pour_la_cr%C3%A9ation_automatique_des_home_utilisateurs#Pr.C3.A9requis
