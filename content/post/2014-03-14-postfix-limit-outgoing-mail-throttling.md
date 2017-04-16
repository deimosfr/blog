---
title: 'Postfix: limit outgoing mail throttling'
author: Deimos
type: post
date: 2014-03-14T11:00:08+00:00
url: /2014/03/14/postfix-limit-outgoing-mail-throttling/
image: https://wiki.deimos.fr/images/3/34/Postfix_logo.png
rating:
  - 3
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Postfix
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Postfix

---
![Postfix_logo](https://wiki.deimos.fr/images/3/34/Postfix_logo.png)

When you have a huge amount of mail to deliver, you can't release the queue at once and let the server maximize the outgoing mail throughput ! The result will be: you'll get blacklisted from a lot of MX servers.

That's why you should take care of it and do traffic shaping. [I've wrote a little tips on it](https://wiki.deimos.fr/Postfix:_limit_outgoing_mail_throttling).