---
title: 'Nginx: enable HSTS (force SSL for users)'
author: Deimos
type: post
date: 2014-09-18T10:00:21+00:00
url: /2014/09/18/nginx-enable-hsts-force-ssl-for-users/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
  - Security
  - Web
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
  - Security
  - Web

---
![Nginx-logo](/images/logo_ngnix.png)
I recently heard of HSTS which is a way to force users to come back to your website in SSL if they've already be to HTTPS once. It is simple, just add this line:

{{< highlight bash >}}# HSTS (force users to come in SSL if they've already been once)
add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";{{< /highlight >}}

If you want to have an overview of a complete configuration with it, [look at the my wiki](https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#Configuration_4).
