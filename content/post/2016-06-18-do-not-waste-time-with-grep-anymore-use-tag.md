---
title: Do not waste time with grep anymore, use tag
author: Deimos
type: post
date: 2016-06-18T07:44:11+00:00
url: /2016/06/18/do-not-waste-time-with-grep-anymore-use-tag/
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
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left

---
![tag](https://github.com/aykamko/tag/raw/master/tag.gif)
Long time since my last post. This one is not very technical post, but it's a nice to have solution if you use grep usually. Are not you fed up to type vim <file> and search the line after a grep command ? If yes, this post is for you.

First of all, you may know that an alternative more user friendly to grep exist, called ag ([perf comparison][1]). I really like ag and grep, but something make me loose my time since several years and I'm pretty sure it's your case too.

Let's say you generally want to parse files, find the information and jump with vim into it. With [tag][2] (using ag only) you can do it in only 2 commands. Let say I want to search my username in /etc:

{{< highlight bash >}}
$ sudo tag pmavro /etc/
/etc/mailname
[1] 1:mbp-pmavro

/etc/gshadow
[2] 18:cdrom:*::pmavro
[3] 19:floppy:*::pmavro
[4] 22:audio:*::pmavro,pulse
[5] 23:dip:*::pmavro
[6] 33:video:*::pmavro
[7] 35:plugdev:*::pmavro
[8] 47:netdev:!::pmavro
[9] 53:bluetooth:!::pmavro
[10] 54:pmavro:!::
[11] 60:docker:!::pmavro
{{< /highlight >}}

Now if I want to edit /etc/gshadow at line 54 with vim, I only have to type in the terminal:

{{< highlight bash >}}
$ e10
{{< /highlight >}}

"e" will read a temporary file containing the result and 10 will ask vim to position in the file to the matching line number.

User friendly and really simple right ?

Hope this will help

 [1]: https://www.reddit.com/r/commandline/comments/3wwyvh/ag_vs_grep/
 [2]: https://github.com/aykamko/tag
