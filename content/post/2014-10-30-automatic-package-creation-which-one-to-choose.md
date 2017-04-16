---
title: Automatic package creation, which one to choose?
author: Deimos
type: post
date: 2014-10-30T11:00:00+00:00
url: /2014/10/30/automatic-package-creation-which-one-to-choose/
image: /images/bintry_packager.png
thumbnailImage: /thumbnails/bintry_packager.png
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
![bintry_packager](/images/bintry_packager.png)
I'm currently developing a complete packaging stack based on Docker to easily make different kind of packages for several Linux distributions. This for [MySecureShell project][1].

This stack will be used to build packages in destination of upstream Linux distribution packages. But I'd like to provide a simpler and faster way to create custom repositories mainly for Debian, Ubuntu, CentOS and Fedora. In addition if packages could be automatically created when a new tag is pushed to the GitHub account, it would be perfect.

Hopefully this kind of solution exists, but I'm not sure about which one is better. I've found [Bintray][2] and [Packager][3]. Both have nice features but they do not looks to do exactly the same thing.

That's why I would like some feedbacks of some who already used it. If you've got any other suggestions, I'm interrested in!

Thanks in advance my readers :-)

 [1]: https://github.com/mysecureshell/mysecureshell
 [2]: https://bintray.com/
 [3]: https://packager.io/