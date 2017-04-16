---
title: 'Wireshark: remotely analyze tcpdump using SSH'
author: Deimos
type: post
date: 2014-11-13T11:00:35+00:00
url: /2014/11/13/wireshark-remotely-analyze-tcpdump-using-ssh/
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---

I recently saw a blog post (don't remember the link :-() on something I used several times but never made an article on. So this time, I'm making a blog post on it as this is solution is very useful.

I'm pretty sure you already had to tcpdump on a remote server to investigate. When you have a lot of traffic, it can start to be painful to add a lot filter, having no colors, reading tcpdump row format etc... And most of the time Wireshark can help on having a better visibility on what happens.

In that case, if you want to analyze with Wireshark, you have about 4 options:

  * Having a graphical user interface on the server: forget about it
  * Having a X server running with Wireshark on the server, then forward X: you can forget it as well
  * Forward tcpdump output to a file, transfer it locally and analyze it with Wireshark: better but not enough friendly in my opinion
  * Stream through SSH the tcpdump output and analyze it locally with Wireshark: better now :-)

For this last case, it can seems complicated but not at all. Locally create a fifo file:

{{< highlight bash >}}
mkfifo /tmp/wshark
{{< /highlight >}}

Then connect to your remote server through SSH and run tcpdump (here is a basic example, but adapt it with your filters):

{{< highlight bash >}}
ssh root@ip "tcpdump -s 0 -U -n -w - -i eth0 not port 22" &gt; /tmp/wshark
{{< /highlight >}}

Then launch Wireshark locally pointing to the fifo file:

{{< highlight bash >}}
wireshark -k -i /tmp/wshark
{{< /highlight >}}

Here you have the output in realtime of your server through Wireshark :-)

Hope this will help