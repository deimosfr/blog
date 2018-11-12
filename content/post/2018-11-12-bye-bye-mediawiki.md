---
author: Deimos
type: post
url: /2018/11/12/bye-bye-mediawiki/
categories:
  - linux
  - mediawiki
date: 2018-11-12T00:00:00+02:00
tags:
  - linux
  - mediawiki
image: /images/logo_mediawiki.png
thumbnailImage: /thumbnails/logo_mediawiki.png
thumbnailImagePosition: left
title: Bye bye Mediawiki
url: /2018/10/11/bye-bye-mediawiki/

---

![MediaWiki_logo](/images/logo_mediawiki.png)

After more than 10 years using my beloved [Mediawiki (wiki.deimos.fr)][4], I decided to convert it into static html files and stop using Mediawiki :(.

Why? Because maintaining a [Mediawiki][1] is a pain when you're using a lot of extensions. In addition, I'm not using Mediawiki anymore at work, not really following the evolution, don't want to keep maintaining php/mariadb/nginx and upgrading Mediawiki configuration can be complex as well.

I really love markdown solutions generating static files like [Hugo][3] and I already did it whith my previous [Wordpress][2]. Unfortunately, I didn't found any solution to convert a Mediawiki instance to another markdown solution, so I prefered stop using it.

I used this [script][5] to convert it to html:

```bash
wget --recursive --page-requisites --html-extension \
      --convert-links --no-parent -R "*Special*" -R "Special*" -R "*action=*" \
      -R "*printable=*"  -R "*oldid=*" -R "*title=Talk:*" \
      -R "*limit=*" "https://wiki.deimos.fr"
```

Then I added it to GitHub and enabled [pages][6]. Now all my technical post will be available on my [blog][7].

 [1]: https://www.mediawiki.org/wiki/MediaWiki
 [2]: https://blog.deimos.fr/2017/04/18/blog-migrated-to-hugo-on-github/
 [3]: https://gohugo.io/
 [4]: https://wiki.deimos.fr
 [5]: http://camwebb.info/blog/2012-12-20/
 [6]: https://pages.github.com/
 [7]: https://blog.deimos.fr
