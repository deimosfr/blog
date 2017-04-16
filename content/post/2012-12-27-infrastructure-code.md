---
title: Infrastructure as code
author: Deimos
type: post
date: 2012-12-27T11:00:19+00:00
url: /2012/12/27/infrastructure-code/
categories:
  - Hi-Tech
  - Others
tags:
  - Hi-Tech
  - Others

---
Je ne sais pas si vous avez déjà entendu parler de gérer une infrastructure comme un développeur le ferait avec du code. A première vue cela semble étrange, mais après réflexion vous allez voir que c’est très astucieux.

Déjà pour commencer...qui utilise cette méthode ?

  * OpenStack : [https://review.openstack.org](https://review.openstack.org)
  * MediaWiki : [https://lwn.net/Articles/480002/](https://lwn.net/Articles/480002/)

Plutôt des gens qui ont de grosses infrastructures donc. Mais concrètement en quoi ça consiste ? Beaucoup d'articles existent en anglais sur le net et abordent le sujet, mais je n'en ai pas vraiment trouvé qui parlaient de comment mettre en place ce genre de méthodes et avec quels outils. Je vais donc tenter de vous expliquer.

  1. Prenons le cas d'une boîte qui utilise des VMs (comme la plus part maintenant) pour faire des tests ou sont utilisées pour la gestion du SI ou bien de la prod d'une quelconque manière...Nous somme d'accord que nous multiplions les OS, que la gestion de ceux ci peuvent être fastidieux. Pour ceux qui utilisent de l'Amazon EC2 ou de l'OpenStack, ils en savent généralement quelque chose puisqu'une une VM, une fois éteinte, est totalement effacée. Bref, c'est du consommable.
  2. Pour gérer tous ces nœuds, on va utiliser [Puppet](http://wiki.deimos.fr/Puppet_:_Solution_de_gestion_de_fichier_de_configuration). Si vous me suivez depuis un moment vous savez que j'ai fais pas mal d'articles dessus et [que j'ai des docs sur le sujet](http://wiki.deimos.fr/Serveurs#Puppet). Donc Puppet est un premier outil dans la gestion de parc de type Infrastructure as Code.
  3. Si vous êtes habitué à Puppet vous avez normalement un [VCS](http://wiki.deimos.fr/Serveurs#Versionning) qui va vous permettre d'archiver vos configurations et peut être même vous utilisez des branches pour séparer simplement le test de l'UAT et de la prod. Encore une méthode d'infrastructure as code.
  4. Vous utilisez un framework d'orchestration de type [MCollective](http://wiki.deimos.fr/MCollective_:_lancez_des_actions_en_parall%C3%A8le_sur_des_machines_distante) pour contrôler tous vos nœuds. Parce que devoir se connecter sur x machines pour récupérer des infos ou devoir scripter des commandes SSH, ce n'est simplement plus envisageable, c'est une perte de temps.
  5. On va utiliser [Jenkins](http://wiki.deimos.fr/Jenkins_:_Mise_en_place_d%27un_outil_d%27int%C3%A9gration_continue) pour effectuer des tests automatisés. Lors d'un changement sur une branche de test de votre configuration Puppet, Jenkins va reconstituer une plateforme de test via OpenStack par exemple, puis intégrer cette machine a votre Puppet de test, exécuter votre nouvelle configuration Puppet, puis indiquer si cela fonctionne ou non. Il fera ensuite le ménage.

Pour résumer, tout comme du code, nous allons avoir :

  * Des tests de non régression pour améliorer la qualité de nos plateformes via [Jenkins](http://wiki.deimos.fr/Jenkins_:_Mise_en_place_d%27un_outil_d%27int%C3%A9gration_continue)
  * Un historique de tout ce qui est déployé sur nos serveurs, le [VCS](http://wiki.deimos.fr/Serveurs#Versionning) est la pour ça.
  * Un gain de temps sur le management de ces machines via [Mcollective](http://wiki.deimos.fr/MCollective_:_lancez_des_actions_en_parall%C3%A8le_sur_des_machines_distante).
  * Nous avons des configurations ISO et maîtrisées via [Puppet](http://wiki.deimos.fr/Serveurs#Puppet). Si une VM doit être remontée a l'identique...pas de problèmes.
  * Et enfin une infrastructure horizontalement scalable via OpenStack ou tout système de virtualisation basé sur le même modèle.

J'espère vous avoir fait comprendre l'idée de l'Infrastructure as code et des avantages a gérer son parc de la sorte. Je n'ai volontairement pas parlé du monitoring car il me semble que cela coule de source. Il peut être en tous cas géré directement depuis Puppet.
