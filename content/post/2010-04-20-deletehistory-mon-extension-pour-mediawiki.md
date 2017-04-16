---
title: 'DeleteHistory : Mon extension pour MediaWiki'
author: Deimos
type: post
date: 2010-04-20T15:58:24+00:00
url: /2010/04/20/deletehistory-mon-extension-pour-mediawiki/
categories:
  - Developement
  - Hi-Tech
  - Web
tags:
  - dev
  - mysql
  - php
  - Web
  - wiki

---

Et bien me voilà encore en pleine créativité, on ne m’arrête plus !!!! Pour la petite histoire, il y a maintenant peut être 2 ans, je cherchais une extension pour MediaWiki me permettant de supprimer mon historique. J’avais trouvé l’extension parfaite [SpecialDeleteOldRevisions][1], mais lors d’une upgrade, impossible de la faire fonctionner correctement. Toujours pas d’update de cette extension 1 an après. Je m’étais dis que j’en ferais une un de ces 4. C’est maintenant chose faire et je la trouve mieux que l’originale. Pourquoi ? Tout simplement car j’utilise des scripts php de maintenance fournit par MediaWiki au lieu de faire moi même le taf dans la base de données.
  
Comme ça avec les nouvelles versions, je n'aurais pas de soucis puisque ce script devrait évoluer également avec les versions. En même temps que je développait, je me suis aperçu qu'une nouvelle version de SpecialDeleteOldRevisions était sortie.
  
Je n'ai de toutes façons pas développer pour rien puisque c'est mon extension et je peux la maintenir. Elle est pour le moment accessible sur mon Git et je ne vais pas tarder à la mettre sur le site officiel de MediaWiki :
  
[http://www.deimos.fr/gitweb/?p=mediawiki_extensions.git;a=summary][2]

 [1]: http://www.mediawiki.org/wiki/Extension:SpecialDeleteOldRevisions
 [2]: http://git.deimos.fr/?p=mediawiki_GoogleSearch.git;a=summary
