---
title: VIM pour Eclipse
author: Deimos
type: post
date: 2009-12-06T10:37:19+00:00
url: /2009/12/06/vim-pour-eclipse/
categories:
  - Developement
  - Hi-Tech
tags:
  - Developement
  - Hi-Tech

---

Je pense avoir trouvé le plugin Eclipse qu’il me fallait. Il utilise en fait gvim. Mon problème était donc d’adapter gvim pour qu’il puisse utiliser ma conf de vim. Tout ne passait pas correctement, j’ai donc adapter comme il fallait mon .vimrc afin qu’il se rapproche au mieux de vim.

Il faut donc installer le plugin à l'adresse suivante : <http://vimplugin.sourceforge.net/>.

Un une fois installé, il faut l'activer dans les préférences gvim, puis l'associer aux extensions de fichier souhaité. C'est bien beau tout ça, mais du coup, on perd pas mal de fonctionnalités gagnées avec Eclipse et ses extensions. L'avantage d'utiliser gvim est donc assez limité.

C'est pourquoi il faut chercher tout comme Eclipse à faire passer VIM en tant qu'IDE. J'ai donc trouvé ce qu'il fallait pour Perl (ce qui m'intéresse le plus pour le moment) et l'ai mis sur Git. Je continue toujours à chercher à améliorer l'utilisation, mais me il reste encore quelques petites choses supplémentaires pour égaler l'usage qu'on peut en avoir avec Eclipse.

Si vous suivez mon git ([http://git.deimos.fr][1]) vous verrez les évolutions de mon VIM.

 [1]: http://www.deimos.fr/gitweb/
