---
title: 'Ccze: easily colorize your logs output'
author: Deimos
type: post
date: 2014-03-28T11:00:00+00:00
url: /2014/03/28/eccza-easily-colorize-your-logs-output/
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---

Some of you will tell me that most utility is doing it as well. And that's right, but with ccze you will be able to colorize everything with a pipe. For example when you play with a verbose service like Pacemaker, you need to get colorization if you want to win time. Here is an example:

{{< highlight bash >}}
tail -f /var/log/syslog | ccze -A
{{< /highlight >}}

![ccze_screenshot-300x80](/images/ccze_screenshot-300x80.png)
