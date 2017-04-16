---
title: 'Mediawiki / Wikipedia : Leurs gestion de parc'
author: Deimos
type: post
date: 2013-03-25T11:00:17+00:00
url: /2013/03/25/mediawiki-wikipedia-leurs-gestion-de-parc/
image: /images/logo_mediawiki.png
thumbnailImage: /thumbnails/logo_mediawiki.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Web
tags:
  - Hi-Tech
  - Web

---
![MediaWiki_logo](/images/logo_mediawiki.png)
J'ai récemment écrit un article sur le blog de [Linagora](http://www.linagora.com/), concernant ce que j'ai pu voir au FOSDEM. Voici mon article :

MediaWiki est un logiciel libre orienté serveur, disponible sous Licence publique générale GNU (GNU General Public License – GPL). Il est conçu pour fonctionner dans une ferme composée d’un bon nombre de serveurs appartenant à un site web qui peut avoir plusieurs millions de clics par jour. MediaWiki est un logiciel extrêmement puissant, adaptable à souhait et permettant une implémentation de wiki aux fonctionnalités riches. Il utilise PHP pour interpréter et afficher les données contenues dans une base de données de type MySQL/PostgreSQL.

Wikipedia doit gérer de grosses infrastructures pour son service en ligne d’encyclopédie. Le nombre de visite par jours est de plusieurs millions.

Cette encyclopédie repose sur l’outil MediaWiki développé en PHP. MediaWiki est un outil fiable et stable, même avec des milliers de personnes connectés. Pour arriver à de telles performances, il a fallut adapter les techniques de QA (Quality Assurance) au fil du temps pour assurer l’excellente qualité du produit.

MediaWiki a su s’adapter avec le temps et utilise aujourd’hui des techniques de DevOps pour gérer les mises à jour du produit et c’est ce que nous allons expliquer ici.

Tout d’abord, pour la gestion de version. MediaWiki a utilisé depuis des années Subversion. C’est un très bon outil, toujours très utilisé, mais il ne dispose pas des avantages d’un VCS décentralisé. Et MediaWiki en avait vraiment besoin au vu du très grand nombre de contributions pour les extensions par exemple (sans parler des avantages natifs d’un VCS décentralisé). L’outil principale de versionning est donc passé à Git (créé par Linus Torvald). Une intégration plus importante a été faite entre Git et MediaWiki dans la version 1.20.

Ensuite, il a fallu changer les modes de validation des changements et passer à un outil plus adapté, tout en étant capable de se connecter à un VCS. C’est pourquoi Gerrit a été choisit. Cela permet par exemple lors d’une proposition de changement (bug, amélioration…) d’être validée par plusieurs personnes habilités avant d’être enfin intégrée dans le code.

L’interface graphique est testée à chaque ajout dans le code principale. Pour tester l’interface graphique, MediaWiki utilisait Selenium, qui est aujourd’hui l’un des plus connu pour ce type de tests. C’est très efficace, mais pas forcément très performant du fait qu’il faut ouvrir un navigateur, lancer les tests unitaires et le fermer le navigateur. Pour gagner du temps, le choix d’utiliser PhantomJS a été fait. C’est un navigateur web invisible utilisant le moteur Gecko (de Mozilla). Du fait qu’il ne s’affiche pas, le gain de temps pour les tests est énorme.

Puis, dans les outils en plein essor, il y a Cucumber. C’est un outil permettant d’exécuter des scripts pour des automatisations dans un langage très proche du langage humain. Il est donc très simple d’écrire une succession d’étapes à faire, en Anglais, Français ou autre langue supportée par Cucumber. Ce qui permet à n’importe qui d’écrire ce type de tests et en fait un langage clair pour n’importe qui.

Et enfin, Jenkins qui permet d’exécuter une suite de tests unitaires. Cet outil est très utilisé dans beaucoup de situation et permet de donner le résultat d’une suite de tests unitaires.

Donc toute cette suite permet à Jenkins de lancer des suites de tests via Cucumber, qui vont faire appel à PhantomJS, lorsqu’un nouvel ajout dans Git sera effectué (après validation dans Gerrit biensur). L’un des gros avantages de cette solution par rapport à une autre est que Jenkins donnera non pas une staktrace classique en cas de problème, mais la suite de tests Cucumber extrêmement lisible. Ce qui facilitera considérablement la reproduction d’un bug.

Pour conclure, la solution de MediaWIki / Wikipedia est très mature, mais nécessite encore de beaucoup de tests unitaires pour que celle ci soit à la hauteur de leurs attentes. Mais pour les utilisateurs, c’est aujourd’hui déjà très bien.

Vous pouvez aller voir les articles de mes collègues qui sont très bon : [http://08000linux.com/blogs/team/](http://08000linux.com/blogs/team/)