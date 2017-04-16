---
title: 'WordPress: how I almost lost my blog and want to switch'
author: Deimos
type: post
date: 2015-01-29T11:00:01+00:00
url: /2015/01/29/wordpress-how-i-almost-lost-my-blog-and-want-to-switch/
image: /images/epic_fail_cry.jpg
thumbnailImage: /thumbnails/epic_fail_cry.jpg
thumbnailImagePosition: left
categories:
  - Databases
  - Hi-Tech
  - Others
  - Private life
  - SQL
  - Web
tags:
  - Databases
  - Hi-Tech
  - Others
  - Private life
  - SQL
  - Web

---
![epic_fail_cry](/images/epic_fail_cry.jpg)
A few days ago I wanted to play with [HAProxy SSL offloading](https://blog.deimos.fr/2015/01/27/offload-ssl-with-haproxy/). It was a good experience and alternative to [Nginx SSL offloading](https://blog.deimos.fr/2014/01/23/offloading-ssl-with-nginx-and-varnish/) (I already talked about in this blog). But this is not the topic here...

When I was trying to make the offload working on the blog, I modified WordPress options which switched my blog into an infinite loop mode. As it was late and I was tired (bad idea), I just wanted to rollback my changes and needed to recover a SQL backup to do it fast. So I first restored a compressed backup on the host, uncompressed it, didn't checked the size of the backup, dropped the database, created a new one and restored a 0k database! At this time <span id="result_box" class="short_text" lang="en"><span class="hps">my head</span> <span class="hps">wanted</span> <span class="hps">to</span> <span class="hps">throw</span> <span class="hps">against the wall.</span></span>

When I was searching for a previous backup, I didn't find any correct one, because of an option I changed a few months ago in MariaDB, this is also called a big fail ;-),. At this time I thought having totally lost my blog. My backup script didn't catch the issue I had :-(.

So on the road to find an impossible dump, I decided to deploy a [Vagrant](https://blog.deimos.fr/2013/07/11/vagrant-i-finally-dropped-kvm-for-virtualbox/) Debian box running MariaDB and restored the MySQL data folder with tables files (complete /var/lib/mysql) inside this VM. I started MariaDB without any problems and launched a forced repair of all the tables (Thanks MariaDB). That was quite fast because I do not have a big database (only a few hundreds of Mb). Once done I dumped it without errors and could restore the database on my server.

This is how I recovered it. The funniest thing in that story is I was searching for a WordPress alternative a few hours before. I'm a little bit fed up having a database just for blogs with so less interaction. That's why I'd like to switch to another one.

My goal is to have a blog:

  * Faster (ideally static)
  * Without database
  * Git-able
  * Writable in Markup
  * With social integration
  * With social publish
  * With code syntax color

I've found [Jekyll](http://www.google.fr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CCMQFjAA&url=http%3A%2F%2Fjekyllrb.com%2F&ei=tUvFVOP-GY3sateVgvAB&usg=AFQjCNGs2NPErI0nNoxi8et5v5227blLzQ&bvm=bv.84349003,d.d2s) or [Octopress](http://www.google.fr/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CCMQFjAA&url=http%3A%2F%2Foctopress.org%2F&ei=yUvFVKOqIdXbas2GgbAN&usg=AFQjCNH5__SGXDyujngHSK0T14xsrnJHOw&bvm=bv.84349003,d.d2s) as the best alternative. A colleague also talked to me about [GetGrave](http://getgrav.org/). It seems that all of those points can be covered. I would like feedbacks from my readers please :-).

Now the first thing I'm going to add in my todo top list, is the implementation of a Jenkins to replay backups and monitoring integration. I can't lost my data because of a such silly thing. The other thing I once again observe is to stop doing things like this when tired.