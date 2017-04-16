---
title: 'Vim : use Vundle to install your plugins'
author: Deimos
type: post
date: 2013-07-01T10:00:00+00:00
url: /2013/07/01/vim-using-vundle-to-install-your-plugins/
categories:
  - Linux
tags:
  - Linux

---
![Vim-editor_logo](/images/logo_vim.png)

I recently talked to a colleague about Vim. As he's a Vim poweruser (VimNinja in my articles comments), he has a lot of interesting tips.

He also talked to me about a super plugins manager that can handle any plugins stored locally, on github or vim scripts. This manager is a vim plugin as well, called Vundle.

I've adapted my Vim configuration with it. So now [on my Git](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/vim), I simply have my vimrc and the Vundle plugin. If I launch it on a new machine it will automatically download all missing plugins and load them on Vim start.

I also discovered "vim Jedi" which is steroids boosted python auto completion plugin. I really love that one.

Thanks Nicolas for this discovery :-)