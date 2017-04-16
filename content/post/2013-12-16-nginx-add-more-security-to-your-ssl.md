---
title: 'Nginx : add more security to your SSL'
author: Deimos
type: post
date: 2013-12-16T11:00:21+00:00
url: /2013/12/16/nginx-add-more-security-to-your-ssl/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
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
In those time, security is more and more important. Some vulnerabilities have been discovered and security on your SSL should be added. In fact you need to restrict the possibilities to your SSL server to avoid SSL breaks.

I've [updated my documentation][1] to add SSL Resumption and authorized ciphers algorithms.

Then you can check your SSL server security here : [https://www.ssllabs.com/ssltest/index.html](https://www.ssllabs.com/ssltest/index.html).

I hope this will help you.

 [1]: http://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#SSL "SSL Nginx"