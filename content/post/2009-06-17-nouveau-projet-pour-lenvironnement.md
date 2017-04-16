---
title: 'phpWOL : Nouveau Projet pour l’environnement'
author: Deimos
type: post
date: 2009-06-17T19:57:31+00:00
url: /2009/06/17/nouveau-projet-pour-lenvironnement/
categories:
  - Environnement
  - Hi-Tech
tags:
  - Environnement
  - Hi-Tech

---

Pour ceux qui ne savent pas, je suis le co-fondateur du projet [MySecureShell][1].

Mon précédent post parlait de l'environnement et du film Home qui m'a déclenché l'envie d'accélérer un projet que j'ai commencé il y a quelques mois maintenant appellé phpWOL (php Wake On Lan).

Je vais le continuer en partenaria avec Teka (Sébastien), mon ami avec qui je fais MySecureShell également afin d'accélérer son développement.

phpWOL a pour but de démarrer des machines à distance. Pourquoi me direz vous ?
  
Tout simplement car dans mon entreprise (et je suis certain que ce n'est pas la seule), des personnes laissent leur PC allumé pour pouvoir s'y connecter durant le week end/un soir en RDP ou VNC. Le constat est qu'ils ne se connectent que peu de temps ou pas du tout et par conséquent gaspillent beaucoup d'énergie et beaucoup d'argent gaspillé. Ce qui n'est ni un avantage pour la planète, ni pour l'entreprise.

phpWOL va donc être installé sur un serveur et va permettre de donner l'état des machines du parc, ainsi que de les allumer. Il va évidement falloir prévoir un système d'ACL se reposant sur du LDAP ou tout autre plateforme d'authentification. De la sorte, les utilisateurs ayant besoin de leur machine, pourront l'allumer et l'éteindre à leur guise.

Je reprendrais donc ce projet sérieusement dès mon retour de voyage de noce.

 [1]: http://mysecureshell.sourceforge.net
