---
title: 'OpenLDAP : les ldif trop complets'
author: Deimos
type: post
date: 2012-11-09T11:00:14+00:00
url: /2012/11/09/openldap-les-ldif-trop-complets/
image: /images/logo_openldap.png
thumbnailImage: /thumbnails/logo_openldap.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---
![OpenLDAP-logo](/images/logo_openldap.png)
Je viens d'apprendre qu'un export LDAP (LDIF) trop complet ne permet pas sa réimportation sous peine de se voir jeter l'erreur 19 à la gueule. En effet, il y a plusieurs champs qui ne doivent pas figurer dans un LDIF.

J'ai donc eu la chance de trouver des personnes a qui ce même problème est arrivé et j'ai donc fais un petit article pour parler de cette erreur sur laquelle j'ai passé 1h.

L'erreur 19 d'LDAP, [ça se passe ici](http://wiki.deimos.fr/LDAP_:_Installation_et_configuration_d%27un_Annuaire_LDAP#ldap_add:_Constraint_violation_.2819.29).