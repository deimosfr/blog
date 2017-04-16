---
title: 'Vagrant: 2 super cool new features in V1.5'
author: Deimos
type: post
date: 2014-03-12T11:00:48+00:00
url: /2014/03/12/vagrant-v1-5-use-boxes-on-vagrantcloud/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Vagrant
  - Virtualization
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Vagrant
  - Virtualization

---
![Vagrant-logo](/images/logo_vagrant.png)

The 1.5 version of [Vagrant](http://www.vagrantup.com/) has been released and that's awesome ! They finally did a Cloud where all Vagrant boxes could ([https://vagrantcloud.com/](https://vagrantcloud.com/)) be inventoried and easily deployed through command line !

You can find [my boxes here](https://vagrantcloud.com/search?utf8=%E2%9C%93&sort=&provider=&q=deimosfr). If you want to add one, it's really simple:

{{< highlight bash >}}
vagrant box add deimosfr/debian-wheezy
{{< /highlight >}}

And the second awesome feature is...the sharing! You can for example have access to a distant and nated Vagrant instance through SSH! The problem of this is enterprise security :-/. Anyway, it's a really cool feature, watch this:

I've updated [my doc with that new version](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines).
