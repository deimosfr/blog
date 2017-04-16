---
title: 'Nginx Substitutions Filter : change of the fly page content'
author: Deimos
type: post
date: 2013-05-14T10:00:35+00:00
url: /2013/05/14/nginx-substitutions-filter-change-of-the-fly-page-content/
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
Nginx Substitutions Filter is a filter module able to do both regular expression and fixed string substitutions on response bodies. This module is quite different from the Nginx's native Substitution Module. It scans the output chains buffer and matches string line by line, just like Apache's mod_substitute.

I've played with the classic substitution module but due to limitations (only one matching pattern and no regex), it wasn't easy to do all I wanted to do. That's why I've searched a better module to add on my Nginx servers. Unfortunately, this module is not currently available in Nginx packages, on Debian. So I've created new packages with Substitutions Filter module built in.

To get a quick overview of what this module is able to do, we're going to take an example. Let's say we need to add a CSS style on every pages on our websites. You've got multiple solutions to do it and most of them need to modify the application code. The problem is, each time you will have an application upgrade, you'll need to think about this modifications. The other solution (if possible) is to create an extension for you application, but it's boring to manage and time consuming.

With that solution, you can change the end of the HTML head banner and add any style or JS banner you want. It works with everything in the HTML code in fact. As described, it's a string replacement solution. This extension is really powerful.

You can find [my documentation on how to compile and package it for Debian](https://wiki.deimos.fr/Http_substitutions_filter_:_multiple_filters_with_regex_on_response_bodies).

Update : this has been added in experimental repository of Debian : [706456][1]

 [1]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=706456