---
title: 2ème et dernier jour au FOSDEM !
author: Deimos
type: post
date: 2013-02-05T11:00:24+00:00
url: /2013/02/05/2eme-et-dernier-jour-au-fosdem-2/
image: /images/logo_fosdem.png
thumbnailImage: /thumbnails/logo_fosdem.png
thumbnailImagePosition: left
categories:
  - Debian
  - Developement
  - HA
  - Hi-Tech
  - Linux
  - Others
  - Private life
  - Puppet
  - Red Hat
  - Security
  - SQL
  - Virtualization
  - Web
tags:
  - Debian
  - Developement
  - HA
  - Hi-Tech
  - Linux
  - Others
  - Private life
  - Puppet
  - Red Hat
  - Security
  - SQL
  - Virtualization
  - Web

---
![fosdem_logo](/images/logo_fosdem.png)
Avant d'attaquer le 2 ème jour, je vais finir sur le premier ([la suite d'hier](http://blog.deimos.fr/2013/02/03/en-direct-du-fosdem-2013/)).

![fosdem2013_bind10-300x225](/images/fosdem2013_bind10-300x225.jpg)

Un des supers sujet était [Bind 10][1] que j'attendais avec impatience. Il n'y a malheureusement eu d'informations sur les nouveautés aidant a la HA. Cependant il a été totalement réécrit pour supporter + de 100 cores alors qu'aujourd'hui au delà de 6, il y a des problèmes de performances. On a également (et étrangement) un serveur DHCP qui est intégré a Bind. Que ce soit le DHCP intégré a Bind ou Bind lui même, ils ont été réécrit from scratch. Certaines fonctions sont intéressante mais il subsiste néanmoins une grosse faiblesse aujourd'hui : migrer les configuration de Bind 9 vers [Bind 10][1] n'est pas possible. Ils ont changés tellement de chose qu'il n'y a pas de rétro compatibilité !!! Ils prévoient les outils de migration plus tard (pas de dates annoncées). La version stable sortira dans quelques mois.

![wpid-wp-1359816076197-300x225](/images/wpid-wp-1359816076197-300x225.jpg)

[oVirt][2] sait communiquer avec [The Foreman][3]. Une manière de plus de se rapprocher de [Puppet][4]. Avec le support de [GlusterFS][5] et les avancées sur [KVM][6], je peux comprendre que VMware est décidé d'injecter des fonds dans [Puppet][4] pour rattraper le retard qu'ils ont sur cette partie là.

Voilà pour la première journée. On peut dire que le [DevOps][7], [Puppet][4], [OpenStack][8], la virtualisation, l'automatisation, [Ruby](http://www.ruby-lang.org/) et la haute disponibilité sont les demandes les plus fortes côté infrastructure.

Passons au 2 ème jour ! [MySQL](http://wiki.deimos.fr/Serveurs#MySQL)/[MariaDB][9] et [PostgreSQL](http://wiki.deimos.fr/Serveurs#PostgreSQL) prennent de l'ampleur coté réplication et haute disponibilité encore une fois !

[MHA][10] : un outil pour superviser et switcher automatiquement des réplications [MySQL](http://wiki.deimos.fr/Serveurs#MySQL)/[MariaDB][9] multi maîtres. C'est fait en Perl, ça sent le truc home made mais vu le nombre de participants dans la salle et les boites qui l'utilisent déjà , ça donne envie d'essayer. [Pacemaker][11] et [Corosync][12] sont nécessaire pour gérer la VIP permettant aux slaves d'aller taper le master. Dans les alternatives, il existe [Tungsten](https://code.google.com/p/tungsten-replicator/), [Percona Replication Server](http://www.percona.com/doc/percona-xtrabackup/howtos/setting_up_replication.html) et [Galera](http://galeracluster.com/products/).

Ensuite une petite séance de [troubleshooting](http://wiki.deimos.fr/MysqlTuner_:_Optimiser_votre_serveur_MySQL). Bon...cette conf est discutable, beaucoup de choses tombant sous le sens. Au final du explain, du slow query, iostat et toute la clique. Intéressant mais je n'ai pas appris grand chose et c'est le sentiment que j'ai eu des autres personnes se trouvant dans la salle.

MySQL 5.6. Les nouveautés ont vraiment l'air sexy. Ça parlait de séparation de requêtes (lecture/écriture), de [MySQL](http://wiki.deimos.fr/Serveurs#MySQL) round robin multi sources en pure SQL, de lissage des réplications en fonction de la timezone des serveurs, d'une API pour que des programmes externes puissent interroger les binlogs !!! Et pour finir quelques sets d'outils très très très utiles : [MySQL utilities](https://dev.mysql.com/doc/workbench/en/mysql-utilities.html) et [MySQL failover utility](http://dev.mysql.com/doc/mysql-utilities/1.3/en/mysqlfailover.html). Bref du lourd pour cette version 5.6 disponible autour de cet été.

![fosdem2013_postgres_rep1-300x225](/images/fosdem2013_postgres_rep1-300x225.jpg)

Côté [PostgreSQL](http://wiki.deimos.fr/Serveurs#PostgreSQL), on à du lourd aussi. Le speaker était très bon (Dimitri Fontaine), il savait ce qu'il racontait et c'était passionnant de l'écouter. Pour alléger des serveurs [PostgreSQL](http://wiki.deimos.fr/Serveurs#PostgreSQL), on aura tendance a mette [PGbouncer](http://pgbouncer.projects.pgfoundry.org/) sur des serveurs web frontaux qui redirigeront le flux sur les serveurs [PostgreSQL](http://wiki.deimos.fr/Serveurs#PostgreSQL) de backend. Rien que de faire ça ,on soulage beaucoup les accès et la charge aux serveurs en backend. Pour les backups, le point in time recovery est très intéressant. Côté réplication, on a les warm standy (esclave inutilisable en dehors de leur rôle principale) et les hot standby sur lesquelles ont peut requêter et définir si la synchro (faites en mémoire) doit être synchrone ou asynchrone. Nous avons plusieurs outils pour répliquer les données, tel que [Slony](http://slony.info/)/[Bucardo](http://bucardo.org/)/[Londiste](https://github.com/markokr/skytools) (apparemment le meilleur).

![fosdem2013_postgres_rep2-300x225](/images/fosdem2013_postgres_rep2-300x225.jpg)

Pour gérer tout ce bazar il y a [walmgr](https://wiki.postgresql.org/wiki/SkyTools#walmgr) ou [WAL-E](https://github.com/heroku/WAL-E). M'y connaissant très très peu en [PostgreSQL](http://wiki.deimos.fr/Serveurs#PostgreSQL), j'espère ne pas avoir fait des bourdes en écrivant ceci, ce n'est pas toujours simple de prendre des notes dans des salles surchargées, avec des difficulutés à entendre l'intervenant et dont la langue parlée n'est pas ma maternelle. Donc n'hésitez pas a me dire si j'ai écris quelques bourdes, je les corrigeraient et prendrais le temps de potasser ces sujets plus tard pour les approfondirs.

Et pour finir [Samba 4](https://www.samba.org/). Je n'ai malheureusement pas pu tout voir mais les mecs ont planché pendant plus de 10 ans dessus et aujourd'hui un seul mec n'est plus capable (comme au temps de samba 3) de tout connaitre sur le sujet. Dans les faits, c'est bel et bien un AD qu'ils ont reproduits, chapeau ! Il reste encore un peu de travail pour arriver à un AD parfaitement identique, mais c'est aujourd'hui utilisable en pré prod.

Et pour finir, j'ai été plusieurs fois aider le stand [Puppet][4]. Voici une petite photo :
  
![fosdem_2013_puppet_moi-300x225](/images/fosdem_2013_puppet_moi-300x225.jpg)

 [1]: http://bind10.isc.org
 [2]: http://www.ovirt.org/
 [3]: http://theforeman.org/
 [4]: http://wiki.deimos.fr/Serveurs#Puppet
 [5]: http://www.gluster.org/
 [6]: http://www.linux-kvm.org/
 [7]: http://blog.deimos.fr/2012/12/29/devops/
 [8]: http://www.openstack.org/
 [9]: http://wiki.deimos.fr/MariaDB_:_Migration_depuis_MySQL
 [10]: http://code.google.com/p/mysql-master-ha/
 [11]: http://clusterlabs.org/
 [12]: http://www.corosync.org/