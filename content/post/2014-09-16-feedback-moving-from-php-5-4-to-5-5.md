---
title: 'Feedbacks: Upgrading from PHP 5.4 to 5.5'
author: Deimos
type: post
date: 2014-09-16T10:00:09+00:00
url: /2014/09/16/feedback-moving-from-php-5-4-to-5-5/
image: /images/logo_php.png
thumbnailImage: /thumbnails/logo_php.png
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
![php_logo](/images/logo_php.png)
Because of the [recent announce from DotDeb about PHP 5.6 availability on Debian](https://twitter.com/dotdeb/status/504994627272056833), I saw that I totally forgot to move from PHP 5.4 to 5.5.

As I'm hosting several WordPress, Mediawiki, Piwik and other PHP web software, I was not very comfortable with that migration. I knew that the major change was on PHP cache. I was intensively using APC cache but in PHP 5.5, it is deprecated and Opcache replace it. The advantage of Opcache is it's embedded in PHP 5.5 and maintained by the PHP team.

So I started the package upgrade which was fine and saw that most of my sites didn't answered properly. The 2 reasons where:

1. Opcode is not activated by default and I needed to enable it in php.ini. Here is my configuration:

{{< highlight ini >}}[opcache]
opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60
opcache.fast_shutdown=1
opcache.consistency_checks=1{{< /highlight >}}

2. The last thing is I had to install an extra package for the cache to be used by the web applications:

{{< highlight bash >}}aptitude install php5-apcu{{< /highlight >}}

Once done, I restarted PHP-FPM and everything was running as expected without any other changes :-)
