---
title: 'Puppet: start to write your own module'
author: Deimos
type: post
date: 2013-08-30T10:00:45+00:00
url: /2013/08/30/puppet-start-to-write-your-own-module/
image: /images/Puppet-short.png
thumbnailImage: /thumbnails/Puppet-short.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Red Hat

---
![Puppet-short](/images/Puppet-short.png)
I didn't really play with Puppet since a long time and a lot of things have changed.
  
I'm currently writing a Puppet module for [MySecureShell](http://mysecureshell.sourceforge.net/). And the thing is, it's hard to quickly find the relevant information on how to build a module from scratch. I like to have experience return and what a chance when I saw a tweet regarding it, the same day as I started to write the module :-)

So here is the first link that I purpose to help you on writing a module :
  
[https://docs.google.com/document/d/sTPuNNsXfVcdbYtFYj6zhpw/headless/print#](https://docs.google.com/document/d/sTPuNNsXfVcdbYtFYj6zhpw/headless/print#)

The second link is on how to build the firsts folders and files for your module : [http://docs.puppetlabs.com/man/module.html](http://docs.puppetlabs.com/man/module.html)

In a word, it's simple :

{{< highlight bash >}}
puppet module generate <username-module_name>;
{{< /highlight >}}

As I want to push my future module upstream to [Puppet forge](https://forge.puppetlabs.com/), I need as well to test each files with a tool named puppet-lint.

I hope I'll be able to send the first version this week or the next one.
