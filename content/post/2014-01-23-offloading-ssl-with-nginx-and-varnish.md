---
title: Offloading SSL with Nginx and Varnish
author: Deimos
type: post
date: 2014-01-23T11:00:47+00:00
url: /2014/01/23/offloading-ssl-with-nginx-and-varnish/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 2
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Web
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Web

---
![Nginx-logo](/images/logo_ngnix.png)
[Varnish](http://wiki.deimos.fr/Varnish_:_un_acc%C3%A9l%C3%A9rateur_de_site_web) is a real powerful cache solution for web servers. He is unfortunately not able to do it over SSL. Anyway, there is a solution by offloading it with [Nginx](http://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache). Here is a schema to get a better understanding :

![Offload-ssl](http://wiki.deimos.fr/images/c/c4/Offload-ssl.png)

Nginx decrypt SSL, pass it in clear to Varnish. If Varnish got it, replies to Nginx which crypt back data to send to user.

I've made a full documentation to get it working well, [follow the link](https://wiki.deimos.fr/Nginx_%2B_Varnish_:_Cache_even_in_HTTPS_by_offloading_SSL).