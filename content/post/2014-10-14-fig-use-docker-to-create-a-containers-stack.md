---
title: 'Fig: use docker to create a containers’ stack'
author: Deimos
type: post
date: 2014-10-14T10:00:03+00:00
url: /2014/10/14/fig-use-docker-to-create-a-containers-stack/
image: /images/logo_fig.png
thumbnailImage: /thumbnails/logo_fig.png
thumbnailImagePosition: left
categories:
  - Debian
  - Docker
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Docker
  - Hi-Tech
  - Linux
  - Red Hat

---
![fig_logo](/images/logo_fig.png)
[Fig][1] is a fast, isolated development environments using Docker. For some features, it can be compared to Vagrant where the Dockerfike is not enough powerful to build multiple instances.

For example, let's say you want to test a new product version of a software like MediaWiki and you want to build the complete stack. So you may need to have several tools categories (depending of the usage):

  * _Web_: [Nginx](https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache), [PHP-FPM](https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#php-fpm), [Varnish](https://wiki.deimos.fr/Varnish_:_un_acc%C3%A9l%C3%A9rateur_de_site_web)
  * _App Cahing_: Redis
  * _Search_: [ElasticSearch](https://wiki.deimos.fr/ElasticSearch:_powerful_search_and_analytics_engine)

In Vagrant you can natively build 3 VM and interconnect them without the need of additional tool. However Docker can only do very basic things with it's dockerfile and that's when Fig enter into action.

You can build a YAML Fig configuration with all your requested tools and configuration. Then you can use it as vagrant with "fig up" command. Another nice feature is the possibility to scale easily by adding new containers with "scale" option. Fig really give some missing features to Dockerfile even if more would be appreciated :-).
  
If you want to know more about Fig and what is possible, then look at the [nice official website][1].

 [1]: http://www.fig.sh