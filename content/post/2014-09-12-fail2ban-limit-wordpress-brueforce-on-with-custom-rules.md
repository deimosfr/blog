---
title: 'Fail2ban: limit WordPress brueforce with custom rules'
author: Deimos
type: post
date: 2014-09-12T10:00:48+00:00
url: /2014/09/12/fail2ban-limit-wordpress-brueforce-on-with-custom-rules/
categories:
  - Hi-Tech
  - Web
tags:
  - Hi-Tech
  - Web

---

I recently worked on a client issues because of massive SQL injections. As it wasn't easily for the client to fix on the application side and the request was urgent, I dig into writing fail2ban custom rules and it works quite well.

I decided to adapt those rules to block bruteforce login attack for WordPress. The problem is WordPress is not returning 403 error code when a user fail to logon but return a 200 instead :-/. So to deal with it without modifying WordPress code, I had to to play with requested URL instead which give something like this:

{{< highlight ini >}}
# WordPress brute force auth filter
#
# Block IPs trying to auth wp wordpress
#
[Definition]
failregex = ^&lt;HOST&gt; -.*"POST.*(wp-login|xmlrpc)\.php
ignoreregex =

{{< /highlight >}}

The problem here is that I'm have to block xmlrpc attacks too which can lead to blocking yourself if you're attempting to update several posts using xmlrpc too. This can generally be the case if you're using WordPress mobile version.

I've made a complete doc here [if you want to setup it for WordPress](https://wiki.deimos.fr/Fail2ban_:_mise_en_place_de_r%C3%A8gles_automatis%C3%A9es_iptables_pour_contrer_les_attaques_par_bruteforce). Hope this will help.