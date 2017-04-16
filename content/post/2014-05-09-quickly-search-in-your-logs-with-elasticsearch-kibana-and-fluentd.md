---
title: Quickly search in your logs with Elasticsearch, Kibana and Fluentd
author: Deimos
type: post
date: 2014-05-09T10:00:13+00:00
url: /2014/05/09/quickly-search-in-your-logs-with-elasticsearch-kibana-and-fluentd/
image: /images/logo_fluentd.png
thumbnailImage: /thumbnails/logo_fluentd.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 2
categories:
  - Databases
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Databases
  - Debian
  - Hi-Tech
  - Linux

---
![Fluentd_logo](/images/logo_fluentd.png)
Managing logs is not a complicated tasks with classical syslog systems (syslog-ng, rsyslog...). However, being able to search in them quickly when you have several gigabit of logs, with scalability, with a nice graphical interface etc...is not the same thing.

Hopefully today, tools that permit to do it very well exists, here are the list of tools that's we're going to use to achieve it:

  * **Elasticsearch**: Elasticsearch is a flexible and powerful open source, distributed, real-time search and analytics engine. Architected from the ground up for use in distributed environments where reliability and scalability are must haves, Elasticsearch gives you the ability to move easily beyond simple full-text search. Through its robust set of APIs and query DSLs, plus clients for the most popular programming languages, Elasticsearch delivers on the near limitless promises of search technology
  * **Kibana**: Kibana is Elasticsearch’s data visualization engine, allowing you to natively interact with all your data in Elasticsearch via custom dashboards. Kibana’s dynamic dashboard panels are savable, shareable and exportable, displaying changes to queries into Elasticsearch in real-time. You can perform data analysis in Kibana’s beautiful user interface using pre-designed dashboards or update these dashboards in real-time for on-the-fly data analysis.
  * **Fluentd**: Fluentd is an open source data collector designed for processing data streams.

[I've made a documentation to achieve this kind of solution](http://wiki.deimos.fr/Fluentd:_quickly_search_in_your_logs_with_Elasticsearch,_Kibana_and_Fluentd):

![Es_ki_fl](https://wiki.deimos.fr/images/e/e7/Es_ki_fl.png)

Thanks to Evoxmusic who tested my documentation :-)