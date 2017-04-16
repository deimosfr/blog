---
title: Sécuriser la sortie de Squid
author: Deimos
type: post
date: 2011-11-07T11:00:49+00:00
url: /2011/11/07/securiser-la-sortie-de-squid/
image: /images/logo_squid.png
thumbnailImage: /thumbnails/logo_squid.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
  - Security
tags:
  - Hi-Tech
  - Linux
  - Security

---
![Squid_logo](/images/logo_squid.png)
C'est un truc con, mais par défaut, Squid donne un peu trop d'informations lorsque quelqu'un le traverse pour accéder à un site.

J'ai donc modifier [la documentation sur Squid](http://wiki.deimos.fr/Squid_:_Installation_et_configuration_de_Squid) pour y ajouter ces 3 petites lignes :
{{< highlight bash >}}
# Be more anonymous
# That’s three pieces of information you may not want to give away:
# - The host name of your proxy server
# - The version of Squid it’s running
# - The IP address of the system that’s making the request via the proxy
forwarded_for off
visible_hostname proxy.local
httpd_suppress_version_string on
{{< /highlight >}}  
