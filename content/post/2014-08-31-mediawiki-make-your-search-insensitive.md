---
title: 'Mediawiki: make your search case insensitive'
author: Deimos
type: post
date: 2014-08-31T10:00:00+00:00
url: /2014/08/31/mediawiki-make-your-search-insensitive/
categories:
  - Databases
  - Hi-Tech
  - Web
tags:
  - Databases
  - Hi-Tech
  - Web

---

For several years, I was wondering how to make Mediawiki search case insensitive. I didn't really had time to look at it until I was really fed up. That's why after a few seconds of search, I've found an extension for Mediawiki which is working perfectly called [TitleKey](http://www.mediawiki.org/wiki/Extension:TitleKey).

> The TitleKey extension provides a case-insensitive title prefix search. It uses a separate table for the keys, so if it works cleanly it can be deployed without an expensive rebuild of core tables, and dumped when Wikimedia gets a nicer backend through Extension:LuceneSearch (pre 1.13) or Extension:MWSearch (1.13+).
> 
> For the average site administrator, the benefit of this extension is that it allows search suggestions (e.g. from Opensearch API) to be case-insensitive.

I've installed it to [my wiki if you want to test](http://wiki.deimos.fr) :-)