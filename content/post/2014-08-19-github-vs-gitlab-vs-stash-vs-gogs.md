---
title: GitHub vs GitLab vs Stash vs Gogs
author: Deimos
type: post
date: 2014-08-19T10:00:08+00:00
url: /2014/08/19/github-vs-gitlab-vs-stash-vs-gogs/
image: /images/logo_github.png
thumbnailImage: /thumbnails/logo_github.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
  - Web
tags:
  - Hi-Tech
  - Linux
  - Web

---
![github-logo](/images/logo_github.png)
I was using Gitweb for about 3 years now and wanted to have a more enhanced web version. I started to look at 3 solutions for my own needs. So my comparison is for my own usage with 2 or 3 friends at max and not for enterprise:

  * **[GitHub](https://github.com/)**: can make free public and paid private repositories. Sounds very good, the most powerful solution of the market in my opinion. However, the cost for private repository is too high in my opinion for personal usages.
  * **[GitLab](https://about.gitlab.com/)**: This solution is a very good alternative to GitHub. But all ruby stuff and dependencies is a real nightmare. That's why GitLab have repositories! But what do they exactly do? Installing a lot of things and calling Chef recipes! Seriously, this is not acceptable. More than that, you need to use PostgreSQL or need to pay to have it working (with packaged version) with MySQL/MariaDB. Too much bad things here, I unfortunately drop the idea.
  * **[Stash](https://www.atlassian.com/fr/software/stash)**: Looks like a good alternative, not free but not too many expensive. I tried it, but using a JVM just for my needs or with some friends consumes too much hardware resources in my opinion. So I drop the idea too.
  * [<strong>Gogs</strong>](https://github.com/gogits/gogs): Gogs is a solution written in Go, not consuming a lot of resources, easy to upgrade, free but a little bit young. There are several bugs, but it does the job quite well and the developer quickly answer then correct bugs are found. The project is really active and ambitious, it has to be more known and used.

So if I resume, GitHub is perfect for public repositories and Gogs do the job for private repositories. My choice is made, I'm now using both to get the better of the both worlds :-)