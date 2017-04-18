---
author: Deimos
categories:
  - Hugo
  - GitHub
date: 2017-04-17T21:28:52+02:00
image: /images/logo_hugo.png
thumbnailImage: /thumbnails/logo_hugo.png
thumbnailImagePosition: left
tags:
  - Hugo
  - GitHub
title: Blog migrated to Hugo on Github
type: post
url: /2017/04/18/blog-migrated-to-hugo-on-github/
---

![Hugo](/images/logo_hugo.png)

As you certainly seen, the [blog][1] has been migrated :-). Visualy there is a big change and technically it's the same.

I was fed up about maintaining Wordpress with its stack (Nginx / php-fpm / MariaDB) for a mostly static blog. I was thinking about migrating from Wordpress to something in markdown since several years but didn't know exactly which solution I wanted to choose. I really enjoyed using Wordpress but wanted to keep hands on my blog and didn't want to switch to full hosted Wordpress because of its limitations (image size etc...).

Finally, I decided to use Hugo which is a good competitor, written in Go (no dependencies), I can write my posts in markdown and the hosting is made on [Github][4]. The solution is smart, quite fast to use, simple, complete enough for a blog and has beautiful themes.

Wordpress comments have been migrated to [Disqus][2] and it was super easy.

I also migrated my [welcome page][3] with Hugo as once again it's simple and I do not need to host it. Github pages do it very well for me :-)

 [1]: https://blog.deimos.fr
 [2]: https://disqus.com/
 [3]: https://www.deimos.fr
 [4]: https://github.com/deimosfr/blog
