---
title: 'media2conflu : encore un nouveau projet'
author: Deimos
type: post
date: 2010-02-10T21:05:57+00:00
url: /2010/02/10/media2conflu-encore-un-nouveau-projet/
categories:
  - Developement
  - Hi-Tech
  - Web
tags:
  - dev
  - Web
  - wiki

---

Décidément, je n’arrête pas ces temps ci ! Là c’est un petit projet par rapport aux autres, mais c’est peut être pour le moment un de ceux que je vais utiliser le plus souvent car très utile pour mon boulot.

Un peu d'explication ne fait pas de mal. J'utilise depuis des années MediaWiki et en suis pleinement satisfait ! Au boulot, il y a quelques années aussi, je n'ai pas réussi à faire appliquer MediaWiki car il ne prenait pas en charge le WIZIWIG et une gestion des ACLs simple. Une alternative payante a été trouvée : Atlassian Confluence.

A première vue, c'est pas trop moche, on peut faire pleins de trucs avec, et puis quand on creuse un peu, qu'on voit qu'avec 1Go de Ram pour la JMX c'est juste, que le WIZIWIG déconne a mort, que déplacer des pages c'est un cauchemars, que la syntaxe n'est pas la même, etc... je regrette tous les jours à mon taf de ne pas avoir forcer un peu plus la main à passer sur MediaWiki.

Bref, ce qui est fait est fait et donc je ne veux plus écrire une doc sur cette m\**** de Confluence tant que la mise en page sera aussi mal gérée. Faites un coup de WIZIWIG, passez en Wiki markup (syntaxe wiki) ou l'inverse et hop, toute votre mise en page est flinguée. Trop c'est trop, je préfère donc faire mes docs sur mon MediaWiki et les transférer sur Confluence. Une fois encore, ça déconne le copier coller (alors que tout ce que je raconte depuis tout à l'heure c'est marqué noir sur blanc que ça marche).

J'en ai eu tellement marre que je me suis dis qu'il fallait trouver un convertisseur. Sur internet, je n'ai rien trouvé, j'ai donc développé ce petit truc qui permet de transformer une page (url) d'un mediawiki en wikimarkup Confluence. Comme ça, plus à se prendre la tête, je fais tout comme d'habitude sur mon MediaWiki et j'utilise mon convertisseur pour mettre sur le Confluence de mon taf.

Pour obtenir ce petit soft, allez faire un trou [sur mon git][1].

Encore une fois, 1ère version, donc un peu d'indulgence. La conversion ne fait pas tout pour le moment, une version 0.2 est en approche rapide.

 [1]: http://www.deimos.fr/gitweb/?p=media2conflu.git;a=summary
