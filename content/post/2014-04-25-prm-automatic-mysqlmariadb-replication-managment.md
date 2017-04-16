---
title: 'PRM: automatic MySQL/MariaDB replication managment'
author: Deimos
type: post
date: 2014-04-25T10:00:38+00:00
url: /2014/04/25/prm-automatic-mysqlmariadb-replication-managment/
rating:
  - 5
votes:
  - 1
categories:
  - Databases
  - Debian
  - HA
  - Hi-Tech
  - Linux
  - Red Hat
  - SQL
tags:
  - Databases
  - Debian
  - HA
  - Hi-Tech
  - Linux
  - Red Hat
  - SQL

---

[The Percona replication manager (PRM)](https://github.com/percona/percona-pacemaker-agents) is a framework using the Linux HA resource agent Pacemaker that manages replication and provides automatic failover. This covers the installation of the framework on a set of servers. The PRM framework is made of 4 components: Corosync, Pacemaker, the mysql resource agent and MySQL itself.

It's easy to setup, better if you already know how to use Pacemaker and it works like a charm. In fact it setup a master and x slaves. If the master crashes, it will switch a slave to a master node and reconfigure automatically all slaves to connect to the new master. Of course it will manage all VIPs.

It works quite well and recently support GTID replication. If you want to setup, look at the [official documentation](https://github.com/percona/percona-pacemaker-agents/blob/master/doc/PRM-setup-guide.rst) which is well written and fast to setup.

You should test it if you want to have multiple slaves servers automatically managed with a master node. This solution is very interesting and I prefer this one instead of MMM & co.