---
title: 'Shell : back to directory command (bd)'
author: Deimos
type: post
date: 2013-09-19T10:00:44+00:00
url: /2013/09/19/shell-back-to-directory-command-bd/
image: /images/Poweredbylinux.jpg
thumbnailImage: /thumbnails/Poweredbylinux.jpg
thumbnailImagePosition: left
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
![Poweredbylinux](/images/Poweredbylinux.jpg)
I recently read a post (on [Korben's blog](http://korben.info/remonter-rapidement-larborescence-en-ligne-de-commande-sous-linux.html)) regarding a command called bd to go back to a directory from you current full path. It permits to do more than that !

In fact this is a simple shell script, but it really helps when you're in a long subfolder list. For example if you reside in '/home/user/project/src/org/main/site/utils/file/reader/whatever' and want to change to '/home/user/project/test', then try 'bd p\`/test.

If you want to see all the possibilities, you can look at [the main site project](https://github.com/vigneshwaranr/bd).

As I use zsh and don't want to add a binary like the official documentation says, I added it as a zsh function. The advantage is I do not need to deploy more than my zsh configuration on a new machine. You can see my configuration on [my git](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/zsh/.zsh).