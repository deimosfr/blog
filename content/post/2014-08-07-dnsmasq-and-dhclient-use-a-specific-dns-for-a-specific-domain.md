---
title: 'Dnsmasq and dhclient: use a specific DNS for a specific domain'
author: Deimos
type: post
date: 2014-08-07T10:00:53+00:00
url: /2014/08/07/dnsmasq-and-dhclient-use-a-specific-dns-for-a-specific-domain/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---
![debian_logo](/images/logo_debian.png)
My use case is specific but not isolated. When I'm at work, I'm connected to my VPN at home. I have a specific DNS at home for my domain in deimos.lan and this is very useful to avoid me to remind all the IP of the services I have.

Sometimes, I want to connect to a home service from the VPN, but my bookmarked links have my home DNS which are unknown from the DNS at work. A solution to make both work, is to add specifics entries in /etc/hosts but it quickly starts to be very boring. That's why I've searched a solution to use my DNS at home only when I try to reach deimos.lan domain.

Using Dnsmasq and modifying dhclient configuration helped me to solve that problem. [Here is my documentation](https://wiki.deimos.fr/Dnsmasq_and_dhclient:_use_a_specific_DNS_for_a_specific_domain). I hope you'll enjoy it