---
title: 'Mincss : Easily minify you CSS'
author: Deimos
type: post
date: 2013-05-08T10:00:11+00:00
url: /2013/05/08/mincss-easily-minify-you-css/
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

I was searching a way to minify my CSS. For those who don’t know what it is, it’s a method to win space for your CSS as it will remove all unneeded blank spaces and lines return. A lot of websites exists to minify your CSS, but if your website is not online and only running locally, you won’t be able to minimize it.

I found a little software written in Python, that makes it easy, called [mincss](https://github.com/peterbe/mincss) (thanks to Peter Bengtsson for it). You will also need phantomjs to make it work (already spoke in my last posts).

How to use it ? simply run it like that :

{{< highlight bash >}}
./run.py http://mylocalwebsite/index.html
{{< /highlight >}}

Quite easy, right ? :-)
