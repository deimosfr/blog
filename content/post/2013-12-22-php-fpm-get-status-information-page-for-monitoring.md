---
title: 'PHP-FPM : get status information page for monitoring'
author: Deimos
type: post
date: 2013-12-22T11:00:19+00:00
url: /2013/12/22/php-fpm-get-status-information-page-for-monitoring/
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
To be able to monitor the PHP-FPM service with connections, queue information, process... you'll need to set the status page. This will give you something like this :

{{< highlight bash >}}
pool: www
process manager: dynamic
start time: 18/Dec/2013:19:00:41 +0100
start since: 52972
accepted conn: 5268
listen queue: 0
max listen queue: 0
listen queue len: 0
idle processes: 3
active processes: 1
total processes: 4
max active processes: 4
max children reached: 0
{{< /highlight >}}

Those informations are important to correctly tune the PHP-FPM service. To add it with Nginx, you can [follow my tutorial (french)](https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#PHP-FPM_Status).
