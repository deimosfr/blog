---
title: 'Ansible: Neo4j role available on Ansible Galaxy'
author: Deimos
type: post
date: 2015-02-27T11:00:01+00:00
url: /2015/02/27/ansible-neo4j-role-available-on-ansible-galaxy/
image: /images/logo_neo4j.png
thumbnailImage: /thumbnails/logo_neo4j.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - NoSQL
  - SQL
tags:
  - Ansible
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - NoSQL
  - SQL

---
![no4j_logo](/images/logo_neo4j.png)
For a new project (will talk about it later), I needed to use Neo4J (graph database if you don't know it yet).

I tried to cover more features than the current existing Ansible roles available on Ansible Galaxy. More will come in the next weeks. I also tried to make it simple to install it and do not force dependencies at maximum. Here are parameters you can set:

{{< highlight bash >}}# Select neo4j version
neo4j_package: neo4j # community version
#neo4j_package: neo4j-advanced
#neo4j_package: neo4j-enterprise

# Neo4j spatial plugin
neo4j_install_spatial: false
neo4j_spatial_version: '0.13-neo4j-2.1.2'
neo4j_plugins_directory: '/usr/share/neo4j/plugins'

# java prerequisite
neo4j_install_java: false
neo4j_java_package_name: openjdk-7-jdk

# limits.conf
neo4j_update_limits: true
neo4j_nofile_value: 40000

# neo4j neostore mapped memory
neo4j_mm_nodestore: 25M
neo4j_mm_relationshipstore: 50M
neo4j_mm_propertystore: 90M
neo4j_mm_propertystore_strings: 130M
neo4j_mm_propertystore_arrays: 130M
neo4j_mm_index: 5M
neo4j_nm_index_keys: 5M
neo4j_cache_type: none

# server
neo4j_server_database_location: data/graph.db
neo4j_server_webserver_address: 127.0.0.1
neo4j_server_webserver_port: 7474
neo4j_server_webserver_https_enabled: false
neo4j_server_webserver_https_port: 7473
neo4j_server_webserver_https_cert_location: conf/ssl/snakeoil.cert
neo4j_server_webserver_https_key_location: conf/ssl/snakeoil.key
neo4j_server_webserver_https_keystore_location: data/keystore

# webadmin
neo4j_server_webadmin_rrdb_location: data/rrd
neo4j_server_webadmin_data_uri: /db/data/
neo4j_server_webadmin_management_uri: /db/manage/
neo4j_server_db_tuning_properties: conf/neo4j.properties
neo4j_server_manage_console_engines: shell
neo4j_server_database_mode: SINGLE

# logging
neo4j_server_http_log_enabled: false
neo4j_server_http_log_config: conf/neo4j-http-logging.xml
neo4j_keep_logical_logs: true
{{< /highlight >}}

You can find [the Ansible role for Neo4j here](https://galaxy.ansible.com/deimosfr/neo4j/), it manages all versions (community, enterprise...) and you can install Spatial plugin as well easilly.

Hope it will help
