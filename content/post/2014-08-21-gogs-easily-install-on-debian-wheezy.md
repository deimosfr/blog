---
title: 'Gogs: easily install on Debian Wheezy'
author: Deimos
type: post
date: 2014-08-21T10:00:30+00:00
url: /2014/08/21/gogs-easily-install-on-debian-wheezy/
image: /images/logo_gogs.png
thumbnailImage: /thumbnails/logo_gogs.png
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
![gogs-lg](/images/logo_gogs.png)
I [recently talked about Gogs](http://blog.deimos.fr/2014/08/19/github-vs-gitlab-vs-stash-vs-gogs/) and really like this solution. The main problem I encounter was the current stable version which may not be usable on Debian.

Here is a quick solution to make it work. First of all, install git:

{{< highlight bash >}}
apt-get install git
{{< /highlight >}}

Then you can download the latest compiled version [directly from gobuild](http://gobuild.io/download/github.com/gogits/gogs).

{{< highlight bash >}}
wget http://gobuild.io/github.com/gogits/gogs/master/linux/amd64 -O output.zip
unzip output.zip
./start.sh

{{< /highlight >}}

You can now access to port 3000. If you want to use it through a web server, here is [my configuration with Nginx](https://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d%27une_alternative_d%27Apache#Gogs).

I hope it helped