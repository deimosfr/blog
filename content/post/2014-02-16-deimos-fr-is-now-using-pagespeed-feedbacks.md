---
title: Deimos.fr is now using PageSpeed :-)…feedbacks
author: Deimos
type: post
date: 2014-02-16T11:00:16+00:00
url: /2014/02/16/deimos-fr-is-now-using-pagespeed-feedbacks/
image: https://wiki.deimos.fr/images/5/50/Pagespeed.png
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
![Pagespeed](https://wiki.deimos.fr/images/5/50/Pagespeed.png)

[Following a previous post](http://blog.deimos.fr/2014/02/12/page-speed-optimize-on-the-fly-your-rendered-code-with-nginx/), I've enabled [PageSpeed](https://wiki.deimos.fr/Page_Speed:_optimize_on_the_fly_your_rendered_code) on both [wiki](http://wiki.deimos.fr) and [blog](http://blog.deimos.fr) deimos.fr.

What I can say is, it's very important to take the time to test every optimizations you want to add. I experienced for example issues on silly things like :

{{< highlight bash >}}
# Optimize browser rendering
pagespeed EnableFilters lazyload_images;
{{< /highlight >}}

Some images weren't shown if you didn't refresh once again your page browser. I only had this problem on the blog and not the wiki. That's why you absolutely need to test everything !

This is not a big feedback but what I can say is, PageSpeed is really good, may be not enough mature to avoid tests but does the job quite well.
