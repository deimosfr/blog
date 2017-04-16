---
title: 'Galera Innoptimizer: optimize tables without stress'
author: Deimos
type: post
date: 2014-09-30T10:00:13+00:00
url: /2014/09/30/galera-innoptimizer-optimize-tables-without-stress/
image: /images/logo_galera.jpg
thumbnailImage: /thumbnails/logo_galera.jpg
thumbnailImagePosition: left
categories:
  - Databases
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - Red Hat
  - SQL
tags:
  - galera
  - mariadb
  - mysql

---
![Galera-Cluster-logo](/images/logo_galera.jpg)
I recently been faced on a classical problem on InnoDB which is the fragmentation, but on Galera. InnoDB engine doesn't defragment on the fly and requires optimize maintenance sometimes to free disk space. But on Galera, which is a fault tolerance and high availability solution, it's a problem having tables locked by an optimize procedure. Until Galera doesn't support TokuDB and only fully support InnoDB, we had (with a colleague (Kevin aka Vinek)) to find a solution. We found that changing RSU mode is the way to achieve it.

That's why **I made a tool to help you to perform all the necessary actions to optimize tables in the most easy and secure way**. Running an optimize on InnoDB tables in a Galera cluster will launch an optimize on every nodes. This is **usually a big problem when using huge tables**. This tool makes **online InnoDB optimize on a Galera single node without tables lock feeling on the user side.** But do not think this is magical as there is a counterpart: you have to reduce the write queries during that time or the optimize will fail with a "dead lock" error message.

Galera has an OSU mode called RSU which permit to perform online schema upgrades. This mode is used by Galera Innoptimizer to perform optimize on tables. The advantage of that solution is you can still perform write (and read of course) updates while running . It won't be replicated on any nodes, simply running locally.

Here is how it works:

{{< highlight bash >}}
&gt; ./ginnoptimizer.py -d all
[+] Trying to connect to MySQL/MariaDB instance...OK
[+] Getting all databases...OK
[+] Checking current Galera state... 
  -&gt; wsrep_ready status...OK
  -&gt; wsrep_cluster status...OK
  -&gt; wsrep_connected status...OK
  -&gt; wsrep_desync status...OK
  -&gt; wsrep_OSU_method status...OK
[+] Getting list of all tables in database1 database...OK
[+] Enabling RSU mode...OK
[+] Starting optimization on database1 database... 
  -&gt; wsrep_flow_control_paused status &gt; 0.3...OK
  -&gt; optimizing tablename in progress...OK
[+] Restoring TOI mode...OK
[+] Getting list of all tables in database2 database...OK
[+] Enabling RSU mode...OK
[+] Starting optimization on database2 database... 
  -&gt; wsrep_flow_control_paused status &gt; 0.3...OK
  -&gt; optimizing tablename1 in progress...OK
  -&gt; wsrep_flow_control_paused status &gt; 0.3...OK
  -&gt; optimizing tablename2 in progress...OK
[+] Restoring TOI mode...OK
Done !
{{< /highlight >}}

To know more about the solution and to get it, please [follow the link of the project](https://github.com/deimosfr/galera_innoptimizer).

Of course this is the first version, I'd like to add more things like database exclude, table include/exclude, percentage of progression etc...Do not hesitate to give feedbacks on it :-)