---
title: 'Pandoc: simplify Beamer/LaTeX with markdown'
author: Deimos
type: post
date: 2014-02-26T11:00:08+00:00
url: /2014/02/26/pandoc-simplify-beamerlatex-with-markdown/
image: /images/Beamer01.png
thumbnailImage: /thumbnails/Beamer01.png
thumbnailImagePosition: left
rating:
  - 2
votes:
  - 1
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---
![Beamer01](/images/Beamer01.png)
Several persons asked me how could they do slides [like I did](http://blog.deimos.fr/2013/06/21/mariadbmysql-slides-for-ha-and-performances-tuning/) with MySQL/MariaDB for example. I mentioned that I used LaTeX with Beamer and they were all frighten by the technology and language (takes too long time to be able to use it).

I think that's not totally wrong but once you've understand how it works...it's fantastic. So for colleagues and friends, I've made a [documentation on how to use beamer](http://blog.deimos.fr/2013/08/16/beamer-my-quick-tutorial-to-write-latex-presentations/) and [provided a template](http://blog.deimos.fr/2013/08/18/my-beamer-example/) to get a quick start on it.

Anyway, even if it helps, they still doesn't want to do more with LaTeX even if they would like to have the beautiful result it produce. I think I've got the solution with [Pandoc](http://johnmacfarlane.net/pandoc/index.html). Pandoc permit to convert from markdown to Beamer :-). Several kind of markdown exist like MediaWiki and several destination exists.

I discover it with [the post of ®om's blog](http://blog.rom1v.com/2014/02/des-slides-beamer-en-markdown/). Thanks to him !

If you're not still convinced, [try the live demo :-) !](http://johnmacfarlane.net/pandoc/try/)