---
title: 'Galera : Enlarge your gcache'
author: Deimos
type: post
date: 2013-11-02T11:00:19+00:00
url: /2013/11/02/galera-enlarge-your-galera-gcache/
image: /images/logo_mariadb.png
thumbnailImage: /thumbnails/logo_mariadb.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - SQL
tags:
  - Hi-Tech
  - SQL

---
![Mariadb-logo](/images/logo_mariadb.png)
Galera uses a preallocated file with a specific size called gcache, used to store the writesets in circular buffer style. By default, its size is 128MB and it's a good idea to upgrade it to a higher value.

I've updated [my documentation on that](http://wiki.deimos.fr/MariaDB_Galera_Cluster_:_la_r%C3%A9plication_multi_maitres) if you want to check. In addition, you can find more informations, I suggest a [Severalnines link](http://www.severalnines.com/blog/understanding-gcache-galera).