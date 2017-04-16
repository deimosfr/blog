---
title: 'Puppet : write module/manifests faster'
author: Deimos
type: post
date: 2013-09-03T10:00:38+00:00
url: /2013/09/03/puppet-write-modulemanifests-faster/
image: /images/Puppet-short.png
thumbnailImage: /thumbnails/Puppet-short.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Linux
tags:
  - Hi-Tech
  - Linux

---
![Puppet-short](/images/Puppet-short.png)
I don't know if you've write with emacs/vim or any other classical tool editor, a manifest or a Puppet module. If you did it, I'm pretty sure you've made a lot of syntax errors or got errors during catalog compilation. During a long time, I was using [Geppetto](http://blog.deimos.fr/2012/05/15/gepetto-un-ide-pour-puppet/) to help me on writing and suggesting better syntax to my manifest.

I took the latest available version of [Geppetto](http://cloudsmith.github.io/geppetto/) but it crashes all the time. As I can't work without assistance manifests (because it's a nightmare when you don't do it day to day), I reminded that I saw a [vim puppet](https://github.com/rodjek/vim-puppet) plugin. After some little searches, I found it easily on Github.

I tried it and searched on other interesting help with vim to write manifests and here is what I found :

  * [Tabular](https://github.com/godlygeek/tabular) : help to get aligned '=>' chars in manifests. Easy to use and works very well
  * [vim puppet](https://github.com/rodjek/vim-puppet) : syntax color for manifests
  * [Syntastic](https://github.com/scrooloose/syntastic) : help on syntax errors, check errors on each saving file
  * [ultisnips](https://github.com/SirVer/ultisnips) : help to write blocks like file, cron, class... simply with tab key

With those plugins I've got everything running easily. To install all of them, I use a tool that I already talk in last posts called [Vundle](http://blog.deimos.fr/2013/07/01/vim-using-vundle-to-install-your-plugins/). So to get this great Puppet environment for vim, add those lines to your ~/.vimrc file :

{{< highlight bash >}}
gmarik/vundle
godlygeek/tabular
rodjek/vim-puppet
scrooloose/syntastic
SirVer/ultisnips
{{< /highlight >}}

And now call from the vim to install every additional plugins :

{{< highlight bash >}}
vim +BundleInstall +qall
{{< /highlight >}}

You can now edit a .pp and see the result by writing a simple manifest :-)

If you want to see my vim configuration, it's available [on my Git](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/vim).
