---
title: 'r10k: manage your Puppet environments dynamically'
author: Deimos
type: post
date: 2014-03-02T11:00:33+00:00
url: /2014/03/02/r10k-manage-your-puppet-environments-dynamically/
image: /images/Puppet-short.png
thumbnailImage: /thumbnails/Puppet-short.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
  - Puppet
tags:
  - Hi-Tech
  - Linux
  - Puppet

---
![Puppet-short](/images/Puppet-short.png)
If you already played with Puppet's environments, you certainly know that the major problem is the static form of them. When you want to test something new (a module for example), it's not quite easy without using environments. **r10k bring the dynamic feature and easy module managment** !

It's really easy to maintain your modules **without using a lot of git submodules**. Simply declare your modules informations like that:

{{< highlight bash >}}
mod 'filemapper',
:git =&gt; 'git://github.com/adrienthebo/puppet-filemapper.git',
:ref =&gt; '1.1.1'
{{< /highlight >}}

and ask r10k to get informations from a GitHub repository for example, with specific tag etc... So you can easily build a huge amount list of module there and easily test a new version of something in a new environment. Then when you call your puppet agent for test, **simply add the correct wished environment variable**.

r10k is a gem and easy to install. When you have more and more environments to manage, you should do it dynamically. More informations are available [on the official GitHub project](https://github.com/adrienthebo/r10k).
