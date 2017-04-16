---
title: 'OpenSSL: diagnose and correct the heartbleed issue'
author: Deimos
type: post
date: 2014-04-08T10:00:08+00:00
url: /2014/04/08/openssl-diagnose-and-correct-the-heartbleed-issue/
rating:
  - 5
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Security
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Security

---
![heartbleed-247x300](/images/heartbleed-247x300.png)

A big and major issue on OpenSSL has been discovered and everybody is talking about it. To get more informations, [there's a website](http://heartbleed.com/).

How to check the vulnerability, [download this file](https://mega.co.nz/#!OpA1DJKC!6Vy7V03TtAL9io41R_-HFQ-8275X3h78Zj87qTs9osI):

{{< highlight bash >}}chmod 755 ssltest.py{{< /highlight >}}

Now launch it:

{{< highlight bash >}}./ssltest.py blog.deimos.fr
Connecting...
Sending Client Hello...
Waiting for Server Hello...
... received message: type = 22, ver = 0302, length = 66
... received message: type = 22, ver = 0302, length = 5559
... received message: type = 22, ver = 0302, length = 587
... received message: type = 22, ver = 0302, length = 4
Sending heartbeat request...
... received message: type = 24, ver = 0302, length = 16384
Received heartbeat response:
0000: 02 40 00 D8 03 02 53 43 5B 90 9D 9B 72 0B BC 0C .@....SC[...r...
[...]
3ff0: 70 78 20 30 20 33 70 78 20 31 2E 35 65 6D 3B 6D px 0 3px 1.5em;m

WARNING: server returned more data than it should - server is vulnerable!{{< /highlight >}}

I was vulnerable as you can see. I deployed latest Debian OpenSSL packages, restarted Nginx and then relaunched the tool:

{{< highlight bash >}}./ssltest.py wiki.deimos.fr -p 443
Connecting...
Sending Client Hello...
Waiting for Server Hello...
... received message: type = 22, ver = 0302, length = 66
... received message: type = 22, ver = 0302, length = 5559
... received message: type = 22, ver = 0302, length = 587
... received message: type = 22, ver = 0302, length = 4
Sending heartbeat request...
Unexpected EOF receiving record header - server closed connection
No heartbeat response received, server likely not vulnerable{{< /highlight >}}

Corrected :-). Now I've to regenerate my SSL certificates as I do not know if someone already stolen my private key :-(

Hope it will help you :-)
