---
title: 'Galera Innoptimizer: now support tables’ partition'
author: Deimos
type: post
date: 2014-10-08T10:00:33+00:00
url: /2014/10/08/galera-innoptimizer-now-support-tables-partition/
image: /images/logo_galera.jpg
thumbnailImage: /thumbnails/logo_galera.jpg
thumbnailImagePosition: left
categories:
  - Databases
  - Developement
  - Hi-Tech
  - SQL
tags:
  - Databases
  - Developement
  - Hi-Tech
  - SQL

---
![Galera-Cluster-logo](/images/logo_galera.jpg)
You may remember the first introduction of [that tool here](http://blog.deimos.fr/2014/09/30/galera-innoptimizer-optimize-tables-without-stress/). I've made changes to support tables' partition, to avoid a big lock on huge tables.

The solution is to rebuild every partition one by one instead of rebuilding the whole table. This is smoother and less stressing Galera. I hope you'll enjoy [this new version (v0.2)](https://github.com/deimosfr/galera_innoptimizer).

Note: I still got issues on MariaDB 10 with such thing, I'm working on it.