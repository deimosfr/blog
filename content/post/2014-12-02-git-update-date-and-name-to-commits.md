---
title: 'Git: update date and name to commits'
author: Deimos
type: post
date: 2014-12-02T11:00:31+00:00
url: /2014/12/02/git-update-date-and-name-to-commits/
image: /images/logo_git.png
thumbnailImage: /thumbnails/logo_git.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
tags:
  - git

---
![Git-logo](/images/logo_git.png)
A lot of time, I had to modify the text of my commit since I'm using a versionning system. Modifying the last commit comment is something common:

{{< highlight bash >}}git commit --amend{{< /highlight >}}

However, modifying the date is not so common. You may want to do it for several reasons (stats or similar), here is how to:

{{< highlight bash >}}GIT_COMMITTER_DATE="`date`" git commit --amend --date "`date`"{{< /highlight >}}

This will change the last commit with the current date.

The last thing I wanted to do is modifying the author. Because I've a personal and professional GitHub account, I made mistake several times using the wrong account. Here is a solution to rename author commits:

{{< highlight bash >}}git filter-branch --env-filter '
oldname="old username"
oldemail="old email address"
newname="new username"
newemail="old username address"
[ "$GIT_AUTHOR_EMAIL"="$oldemail" ] && GIT_AUTHOR_EMAIL="$newemail"
[ "$GIT_COMMITTER_EMAIL"="$oldemail" ] && GIT_COMMITTER_EMAIL="$newemail"
[ "$GIT_AUTHOR_NAME"="$oldname" ] && GIT_AUTHOR_NAME="$newname"
[ "$GIT_COMMITTER_NAME"="$oldname" ] && GIT_COMMITTER_NAME="$newname"
' HEAD{{< /highlight >}}

If you want to know more about some git tips, you can look at [my wiki page](https://wiki.deimos.fr/Mise_en_place_d%27un_serveur_et_client_Git#Modifier_la_date_du_dernier_commit).

Hope this will help
