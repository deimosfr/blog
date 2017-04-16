---
title: 'Ansible: Fluentd and Kibana playbooks updated'
author: Deimos
type: post
date: 2014-12-09T11:00:51+00:00
url: /2014/12/09/ansible-fluentd-and-kibana-playbooks-updated/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Databases
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Ansible
  - Databases
  - Debian
  - Hi-Tech
  - Linux

---
![ansible_logo](/images/logo_ansible.png)
Following the [deployment blog post I made on ES/Kibana/Fluentd](http://blog.deimos.fr/2014/08/15/deploy-a-logs-managememt-infrastructure-elasticsearchkibanfluentd-with-ansible/), I released new version of Fluentd and Kibana playbooks to support the latests versions of themselves and ElasticSearch.

ElasticSearch 1.4 version is ,out which doesn't changed anything for the deployment. However [Kibana](https://github.com/deimosfr/ansible-kibana) requires to enable an ElasticSearch configuration option now, to work properly. I updated the Kibana playbook for it.

On its side, [Fluentd](https://github.com/deimosfr/ansible-fluentd) has the major release 2.0 out and I updated Ansible playbook for the best integration with Debian Wheezy. I kept fluentd version 1 in another branch for the ones who want to keep it.