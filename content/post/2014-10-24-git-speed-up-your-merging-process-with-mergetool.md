---
title: 'Git: speed up your merging process with mergetool'
author: Deimos
type: post
date: 2014-10-24T10:00:15+00:00
url: /2014/10/24/git-speed-up-your-merging-process-with-mergetool/
image: /images/logo_git.png
thumbnailImage: /thumbnails/logo_git.png
thumbnailImagePosition: left
rating:
  - 4
votes:
  - 1
categories:
  - Hi-Tech
  - Linux
tags:
  - git

---
![Git-logo](/images/logo_git.png)
Merging from one branch to another branch is something common with Git. I had to do it several times and recently I had to make a big one. I've just never took the time to look at what exist to make faster merge and how to use it.

After some researches, I found git mergetool which will use VIM (by default on my laptop) to have a better view on what I have to do, to merge my files. And it looks like this:

![three-way-merge-with-vimdiff](/images/three-way-merge-with-vimdiff.png)

The usage of this kind of tool may be confused at the beginning, but if you take some minutes to learn how it works, you'll win a lot of time. Here is a well written [tutorial](http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/) on how to use it. I strongly recommend it.
  
Note that you can also specify other kind of editor if you're not comfortable with VIM which will display others kinds of view the changes. You can find more information [here](http://git-scm.com/docs/git-mergetool).