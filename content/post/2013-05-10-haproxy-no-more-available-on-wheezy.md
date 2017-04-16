---
title: 'HAproxy : no more available on Wheezy :-('
author: Deimos
type: post
date: 2013-05-10T10:00:58+00:00
url: /2013/05/10/haproxy-no-more-available-on-wheezy/
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
How could this happen ? I found a communication on that and it has simply been removed as there were no updates since a long time. Even if CVE were recently proposed, it's considered as not enough :

[http://debian.2.n7.nabble.com/Status-of-haproxy-for-upcoming-wheezy-release-td2907665.html](http://debian.2.n7.nabble.com/Status-of-haproxy-for-upcoming-wheezy-release-td2907665.html)

But guys ! Seriously, do you know how many people are using HAproxy ? It's a shame that it's not in the current stable version of Debian. Now let's check the availability on all Debian versions, it's currently only on oldstable and experimental versions :

[http://packages.debian.org/search?keywords=haproxy&searchon=names&suite=all&section=all](http://packages.debian.org/search?keywords=haproxy&#038;searchon=names&#038;suite=all&#038;section=all)

So what next ? Should we use another solution as it's not available in Wheezy or should be do package pinning ? For the first time, I'm really not happy with a Debian decision. The final answer is finally there, "wait the backport availability" :

[http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674447#53](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674447#53)

I hope this will be done shortly
