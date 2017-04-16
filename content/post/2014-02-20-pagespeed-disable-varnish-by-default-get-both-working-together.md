---
title: PageSpeed disable Varnish by default ! Get both working together
author: Deimos
type: post
date: 2014-02-20T11:00:00+00:00
url: /2014/02/20/pagespeed-disable-varnish-by-default-get-both-working-together/
image: https://wiki.deimos.fr/images/5/50/Pagespeed.png
rating:
  - 5
votes:
  - 1
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

Yesterday a colleague (Dimitri) tested a tool on this blog. He informed me that Varnish was disabled and PageSpeed may be the cause as this is the last [modification I've made on the server](http://blog.deimos.fr/2014/02/16/deimos-fr-is-now-using-pagespeed-feedbacks/).

After verification he was totally right ! By default, PageSpeed disable cache by serving HTML files with:

{{< highlight php >}}
Cache-Control: no-cache, max-age=0
{{< /highlight >}}

After reading the [PageSpeed documentation on that topic](https://developers.google.com/speed/pagespeed/module/downstream-caching), it is clear: PageSpeed needs to know how to purge the cache as it rewrites a lot of elements and it has the control instead of the application. To get Varnish handled by PageSpeed, you need to add and adapt to your configuration those 3 lines for Nginx:

{{< highlight php >}}
pagespeed DownstreamCachePurgeLocationPrefix http://127.0.0.1:80/;
pagespeed DownstreamCachePurgeMethod PURGE;
pagespeed DownstreamCacheRewrittenPercentageThreshold 95;
{{< /highlight >}}

I [updated my documentation with those options](https://wiki.deimos.fr/Page_Speed:_optimize_on_the_fly_your_rendered_code) as well.
