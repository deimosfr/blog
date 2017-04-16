---
title: Bye bye /var/www
author: Deimos
type: post
date: 2012-12-09T11:00:07+00:00
url: /2012/12/09/bye-bye-varwww/
image: /images/logo_debian.png
thumbnailImage: /thumbnails/logo_debian.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![debian_logo](/images/logo_debian.png)
C'est avec tristesse que je vous annonce la fin de /var/www. Ca faisait des années que je m'étais bien habitué à celà. C'est en installant Nginx sur Debian 7 que je me suis rendu compte que /var/www n'existait pas. J'ai donc regardé la conf et que vois je...

{{< highlight bash >}}
root /usr/share/nginx/www;
{{< /highlight >}}

J'ai donc regardé le README.Debian qui me renvoie sur l'explication : [http://lintian.debian.org/tags/dir-or-file-in-var-www.html](http://lintian.debian.org/tags/dir-or-file-in-var-www.html)

Debian a tout simplement remis les choses propres en suivant la FHS. Il est dommage que les choses n'aient pas faites propre dès le début.
