---
title: Gandi API saved my random ISP IP issue
author: Deimos
type: post
date: 2013-09-13T10:00:00+00:00
url: /2013/09/13/gandi-api-saved-my-random-isp-ip/
image: /images/logo_gandi.gif
thumbnailImage: /thumbnails/logo_gandi.gif
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---
![gandi-logo](/images/logo_gandi.gif)
As said in a previous post, I'm going to get Internet through FTTH (Fiber To The Home). Unfortunately **I won't get a fixed IP** like I currently have with my ADSL provider.

It reminds me Internet 10 years before, when I needed to play with [dyndns](http://dyn.com/dns/) or [no-ip](http://www.noip.com/) to be able to connect to my house ISP. The story is now repeating but as I got real DNS instead, **I need to send the modifications to my DNS Registrar instead.**

Thanks to [Gandi](http://www.gandi.net/) to provide an API and thanks to users to give their scripts. I'm using [Gandi-dyndns](https://github.com/lembregtse/gandi-dyndns) and change my IP as soon as possible. The only bad point here, is the TTL of the DNS record that Gandi allow. I **can't reduce the TTL under 300s**. Anyway is is enough for most of my usages.
