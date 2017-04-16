---
title: Forcer un shell lors de logins LDAP
author: Deimos
type: post
date: 2013-04-04T10:00:13+00:00
url: /2013/04/04/forcer-un-shell-lors-de-logins-ldap/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
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
![debian_logo](/images/logo_debian.png)
J'ai récemment aidé un ancien collègue qui avait besoin d'une solution pour forcer des utilisateurs ayant déjà un shell [LDAP](https://wiki.deimos.fr/Serveurs#OpenLDAP) à avoir un shell plus restreint de type [lshell](https://wiki.deimos.fr/Lshell_:_limiter_les_possibilit%C3%A9s_du_shell). La problématique est que si l'on change le shell au niveau LDAP, il faudra alors utiliser ce shell sur toutes les machines. Ce n'est donc tout simplement pas envisageable.

Par contre, il est possible de modifier les propriétés NSS lors du login :-). Allez, [un petit lien comme à mon habitude](https://wiki.deimos.fr/LDAP_:_Installation_et_configuration_d%27un_Annuaire_LDAP#Forcer_un_shell_au_login).