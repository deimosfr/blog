---
title: 'MariaDB : restore on database from a single full dbs backup'
author: Deimos
type: post
date: 2013-11-18T11:00:58+00:00
url: /2013/11/18/mariadb-restore-on-database-from-a-single-full-dbs-backup/
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
I recently discovered how to restore only one database from a huge sql dump containing more than 1 database and wanted to share it with you :

{{< highlight bash >}}
mysql -u&lt;user&gt; -p&lt;password&gt; --one-database &lt;database_name&gt; &lt; backup-`date +%y%m%d`.sql
{{< /highlight >}}

I've added it [to my wiki as well][1].

Source : [System Linux](http://www.system-linux.eu/index.php?post/2013/09/09/Mysql-%3A-Restaurer-une-seule-base-avec-une-sauvegarde-qui-contient-toutes-vos-bases)

 [1]: http://wiki.deimos.fr/Sauvegardes,_restaurations_et_transferts#Restaurations
