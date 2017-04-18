---
title: Deploy a logs management infrastructure (Elasticsearch+Kibana+Fluentd) with Ansible
author: Deimos
type: post
date: 2014-08-15T10:00:00+00:00
url: /2014/08/15/deploy-a-logs-managememt-infrastructure-elasticsearchkibanfluentd-with-ansible/
image: /images/logo_fluentd.png
thumbnailImage: /thumbnails/logo_fluentd.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Databases
  - Hi-Tech
  - NoSQL
  - Web
tags:
  - Ansible
  - Databases
  - Hi-Tech
  - NoSQL
  - Web

---
![Fluentd_logo](/images/logo_fluentd.png)
During the last weeks I started to play with [Elasticsearch](http://blog.deimos.fr/2014/08/09/ansible-elasticsearch-playbook/), [Fluentd](http://blog.deimos.fr/2014/08/13/fluentd-ansible-playbook/) and [Kibana](http://blog.deimos.fr/2014/08/11/ansible-kibana-playbook/). [I made a documentation](https://wiki.deimos.fr/Fluentd:_quickly_search_in_your_logs_with_Elasticsearch,_Kibana_and_Fluentd) to help on deploying it easily.

As you may know, I'm an Ansible fan, so I made Ansible playbooks to deploy a complete infrastructure (server and clients). They will deploy this kind of architecture:

![Es_ki_fl](https://wiki.deimos.fr/images/e/e7/Es_ki_fl.png)

On the client side, Fluentd clients will get syslog and Nginx logs, to send them to the Fluentd server. On the server side, a Fluentd receiver will be there to get data from other Fluentd clients. It will then push it to the Elasticsearch server. The Elasticsearch server is located on the same server than the Fluentd receiver to make it simpler. An autopurge can be configured directly from the playbook using [curator](https://github.com/elasticsearch/curator) tool. To finish, Kibana is installed on the server to make it simpler as well.

You can find [those playbooks on my GitHub](https://github.com/deimosfr) or on [Ansible Galaxy](https://galaxy.ansible.com/deimosfr/fluentd/).

Is it complex to configure Ansible playbooks it? I made my best to make it as quick as possible and as customizable as possible (for the context and my needs). What you need to do is first getting playbooks like this (site.yml):

site.yml:
{{< highlight bash >}}# All machines
- name: fluent-clients
  hosts: all
  user: root
  roles:
    - fluentd
  vars_files:
    - "group_vars/fluentd_client.yml"

# Log
- name: log servers
  hosts: logs
  user: root
  roles:
    - elasticsearch
    - role: nginx
      nginx_sites:
        - server:
           file_name: kibana.domain.com
           server_name: kibana.domain.com
           listen: 80
           root: /usr/share/nginx/www/kibana/src
           location1: {name: /, try_files: "$uri $uri/ /index.html"}
    - kibana
    - fluentd
  vars_files:
    - "host_vars/kibana.yml"{{< /highlight >}}

Then you have to configure/adapt the mandatory options to your needs for fluentd\_clients (fluentd\_client.yml):

fluentd_client.yml:
{{< highlight bash >}}## Fluentd client
# fluentd fqdn used by forwarders to fluentd
fluentd_server_fqdn: kibana.domain.com
# Address of elasticsearch used by fluentd
es_fqdn: localhost
es_port: 9200
# Syslog plugin
fluentd_plugin_syslog_ip: 127.0.0.1
fluentd_plugin_syslog_port: 5140
{{< /highlight >}}

And like this for the log server (kibana.yml):

kibana.yml:
{{< highlight bash >}}## Fluentd server
# Address of elasticsearch used by fluentd
es_fqdn: localhost
es_port: 9200
# If this machine should forward to Elasticsearch
forward_to_es: True
# Curator tool
install_curator: True
curator_max_keep_days: 90
# Head plugin
install_head: True
# ElasticHQ plugin
install_eshq: False
# Marvel plugin
install_marvel: True

## Kibana
# URL address to reach kibana
dns_url_kibana: kibana.domain.com
# Folder to store Kibana
kibana_path: /usr/share/nginx/www/kibana
# Kibana version from GitHub tag
kibana_tag_version: v3.1.0

## Elasticsearch
# Elasticsearch version from debian repository
es_version: 1.3
{{< /highlight >}}

Then launch the Ansible playbook, it will install everything by itself:

{{< highlight bash >}}$ ansible-playbook site.yml
{{< /highlight >}}

At the end, the web interface of kibana will be ready and all your fluentd clients will redirect their syslog and default nginx configuration to ElasticSearch.

Note: I've used my Nginx playbook, but you can use any other one to setup kibana interface as this is made in AngularJS.
