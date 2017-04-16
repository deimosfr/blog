---
title: 'Nginx: limit flooding and aggressive sniffing'
author: Deimos
type: post
date: 2014-05-21T10:00:00+00:00
url: /2014/05/21/nginx-limit-flood-and-aggressive-sniffer/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Security
  - Web
tags:
  - Nginx

---
![Nginx-logo](/images/logo_ngnix.png)
Last week, have been faced on a **big sniffing issue on my wiki**. The guy wanted to download all my wiki content. In reality I do not really care as it is open, free for read and contribution is welcome. However, the current VM where the blog and wiki are running didn't support **aggressive sniffing** that this guy made. That's why **CPUs were at 100% of usage** because of PHP requests, PHP-FPM was overloaded (reached my configuration limits).

The only way to **temporary solve the issue was to block the IP address** (from OVH) with iptables. This guy recurred a little bit slower from another IP (from Orange) a few hours later. I pretty sure this was the same guy as the user agent in the logs was the same in addition of a non usual useragent name:

{{< highlight bash >}}"Mozilla/4.5 (compatible; HTTrack 3.0x; Windows 98)"{{< /highlight >}}

I finally find a long term solution to solve this problem using an **Nginx module called req_limit**. You can specify how many requests per seconds per IPs are allowed, if you return a 503 error or simply delay aggressive requests, burst for a virtualhost etc...

I've added to my current [Nginx documentation (in French)][1] the way to configure this req_limit module. I hope this will help some of you too.

Note for the sniffer guy: you can try now it should be OK :-)

 [1]: http://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#Limiter_le_flood_et_les_sniffers
