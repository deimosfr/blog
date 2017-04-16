---
title: MariaDB 10 is out!
author: Deimos
type: post
date: 2014-04-01T10:00:11+00:00
url: /2014/04/01/mariadb-10-is-out/
image: /images/logo_mariadb.png
thumbnailImage: /thumbnails/logo_mariadb.png
thumbnailImagePosition: left
rating:
  - 4
votes:
  - 1
categories:
  - Hi-Tech
  - Linux
  - SQL
tags:
  - Hi-Tech
  - Linux
  - SQL

---
![Mariadb-logo](/images/logo_mariadb.png)
And finally MariaDB 10 is out! I'm exited to finish my book about it. Here are the news:

  * Replication 
      * MariaDB 10 sets a new standard in performance. It is many times faster than previous generations of MariaDB and especially legacy database MySQL thanks to new features including parallel replication and a further advanced group commit. Also, the replication slaves are now crash-safe.
      * It’s also now possible to replicate data from multiple master servers giving a complete view of the distributed data across big datasets for real-time analytical purposes via the multi-source replication feature.
  * NoSQL Capabilities 
      * The CONNECT engine enables dynamic access to diverse data sources dynamically, including unstructured files such as log files in a folder, or any ODBC database, from within MariaDB 10. Great for ETL (Extraction, Transformation and Load) and Real-Time analysis.
      * Dynamic Columns store disparate labelled data objects in each row of a table in much the same way as NoSQL technologies.
      * Access data from Cassandra data directly inside MariaDB 10, and interoperate directly with a widely adopted Big Data technology.
  * Sharding 
      * MariaDB 10 includes built-in sharding in the form of the SPIDER engine, allowing big database tables to be split across multiple servers, for performance and scale. MariaDB combines sharding with the new replication features to provide true high availability.

You can find the full announcement on the [project's blog here](https://blog.mariadb.org/the-mariadb-foundation-announces-general-availability-of-mariadb-10/).

This blog and the wiki are now on MariaDB 10 :-). The migration is really simple and could be executed as a classical migration for minor version or [migrating from MySQL to MariaDB](https://wiki.deimos.fr/MariaDB_:_Migration_depuis_MySQL).