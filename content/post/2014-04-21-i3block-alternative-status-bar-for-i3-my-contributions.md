---
title: 'i3block: alternative status bar for i3 + my contributions'
author: Deimos
type: post
date: 2014-04-21T10:00:34+00:00
url: /2014/04/21/i3block-alternative-status-bar-for-i3-my-contributions/
rating:
  - 5
votes:
  - 2
categories:
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Debian
  - Hi-Tech
  - Linux

---
![i3-300x286](/images/logo_i3.png)

You know that [I recently switched to i3](http://blog.deimos.fr/2014/04/07/i-finally-switched-from-awesome-to-i3/). One of the first thing I wanted to change is the status bar which is not optimal for my usage.

After researches, it looked like that [i3blocks](https://github.com/vivien/i3blocks) it the best alternative. So I contacted the creator (Vivien) and had very good exchanges with him.

I've made pull requests and suggestions to integrate missing checks, faster one that I developed and with colorization depending of the contexts. Here is what I've purposed:

  * [A new battery module (integrated upstream)](https://github.com/vivien/i3blocks/blob/master/scripts/battery)
  * [A CPU usage check (integrated upstream)](https://github.com/vivien/i3blocks/blob/master/scripts/cpu_usage)
  * [Network bandwidth usage (waiting validation)](https://github.com/vivien/i3blocks/issues/14)
  * [Wireless check (waiting validation)](https://github.com/vivien/i3blocks/issues/15)
  * [New memory check (waiting validation)](https://github.com/vivien/i3blocks/issues/16)
  * [Wired check (waiting validation)](https://github.com/vivien/i3blocks/issues/17)
  * [OpenVPN check (waiting validation)](https://github.com/vivien/i3blocks/issues/18)

Here is the result of what I got today:
  
![i3blocks1](/images/i3blocks1.png)
  
Do not hesitate to try and give feedback.

Thanks and hope you'll try and love it :-)