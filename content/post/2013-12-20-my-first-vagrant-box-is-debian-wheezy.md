---
title: My first Vagrant box is Debian Wheezy
author: Deimos
type: post
date: 2013-12-20T11:00:37+00:00
url: /2013/12/20/my-first-vagrant-box-is-debian-wheezy/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Virtualization

---
![Vagrant-logo](/images/logo_vagrant.png)

If you follow me, you should be aware that I use Vagrant every day. I wanted to get a Wheezy version with fr keyboard, up to date, correct locales and configured source.list file. I've also added Puppet and Chef on it.

So I've learned on how to build a box and it's really easy by [following the documentations on the website](http://docs.vagrantup.com/v2/boxes/base.html). Here is my Debian Wheezy box based on VirtualBox provider available on [DropBox](https://www.dropbox.com/s/gpagp78g4mye1l7/wheezy.box) or [Mega](https://mega.co.nz/#!25olxQQR!e07S0lQbHcNLwOE8y47Foy7451gZq-l2SNB4W7ZYZqw).

I hope you'll use it :-). To add this box to your current list, it's simple :

{{< highlight bash >}}
vagrant box add wheezy https://www.dropbox.com/s/gpagp78g4mye1l7/wheezy.box
mkidr tmp && cd tmp
vagrant init wheezy
vagrant up
{{< /highlight >}}
