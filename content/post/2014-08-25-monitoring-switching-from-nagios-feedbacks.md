---
title: 'Monitoring: switching from Nagios to Naemon (not Shinken or Sensu)'
author: Deimos
type: post
date: 2014-08-25T10:00:00+00:00
url: /2014/08/25/monitoring-switching-from-nagios-feedbacks/
image: /images/logo_naemon.png
thumbnailImage: /thumbnails/logo_naemon.png
thumbnailImagePosition: left
rating:
  - 4.5
votes:
  - 2
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Nagios
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Nagios

---
![naemon_logo](/images/logo_naemon.png)
I am **using [Nagios](http://www.nagios.org/) for about 8 years now for personal and professional usage**. What I can say is, this is a super product, old and stable but **not as scalable** as I would like. We're in the age of Cloud computing and in my opinion we shouldn't have to take care about backup and monitoring in now days, this should be automatic.

I was searching a solution for my personal usages, that's why I first wanted a lightweight solution but with enough maturity to auto discover my newly created LXC containers. In addition, I do not really agree on the strategic position that Nagios is taking so I wanted to change.

That's why I first tried [Shinken](http://www.shinken-monitoring.org/) which was the best solution to fit my vision/needs. Shinken tend to be a powerful, scalable, Nagios configuration file replacement, with advanced features like **auto discovery**. A major version [was recently released](http://shinkenlab.io/2-0-release/) and I wanted to test it. But after 2 hours fighting on installation, trying to understand how the configuration work, because of the lack of documentation actually, I finally stopped to work in that direction as I didn't had enough time to dig in it. However I still keep an eye on it as I'm pretty sure **this will be the best monitoring solutions in the next months/years**.

I also looked at [Sensu](http://sensuapp.org/) as I heard a lot of it since a year and wanted to look ahead. Sensu has **not enough features and maturity** in my opinion to replace Nagios. More than that, **agent is written in Ruby** and I do not agree using with this language in a production environment (because of the required dependencies and resources usage due to this language). Sensu looks like interesting in the way it has been designed (**Redis and RabbitMQ**) but did not convinced me for the previous reasons I mentionned.

Zabbix is a **complete solution** and I always had good feedback about it. The required consuming resources it requires are a little bit high for my personal usage, but the **auto discovery is not fully implemented yet** and new interesting features are planned for next major release. So I didn't choose that solution.

Naemon, [I already talked about it](http://blog.deimos.fr/2013/10/31/omg-nagios-project-is-dead/), this is a **Nagios 4 fork** and looks very interesting. It **doesn't have auto discovery yet** but this is the lightweight solution I've found and doesn't change my Nagios configuration files at all. So I've choose this software for the moment as **no other solution answered more my needs than Naemon**. As there is no auto discovery, I implemented a faked auto discovery feature by automating the integration of new hosts in Naemon with Ansible (better than nothing).

After a few weeks of usage, **Naemon works well, I do not reported any issues**, the installation is really easy and Thruk is the default web interface :-). **Naemon (like Shinken) brings livestatus plugin embedded** with avoid to install all the [check_Mk](https://mathias-kettner.de/check_mk.html) stack. I'm happy to choose that solution even if all my requirements are not there yet.
  
Now I am waiting the maturity of Shinken 2 :-)