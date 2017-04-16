---
title: 'VIM: help coding in Python with plugins'
author: Deimos
type: post
date: 2014-10-20T10:00:53+00:00
url: /2014/10/20/vim-help-coding-in-python-with-plugins/
image: /images/logo_vim.png
thumbnailImage: /thumbnails/logo_vim.png
thumbnailImagePosition: left
categories:
  - Developement
  - Hi-Tech
tags:
  - python
  - vim

---
![Vim-editor_logo](/images/logo_vim.png)
In the last blog posts, I talked about [Galera Innoptimizer](http://blog.deimos.fr/2014/10/08/galera-innoptimizer-now-support-tables-partition/) tool I've made in Python. As a VIM lover, I've wrote it with that editor and installed additional them with [Vundle](https://github.com/gmarik/Vundle.vim).

Here are the one I'm using (to my .vimrc file):

{{< highlight vim >}}
" Python completion
Plugin 'klen/python-mode'
" Tabular
Plugin 'godlygeek/tabular'
" Git Gutter
Plugin 'airblade/vim-gitgutter'
{{< /highlight >}}

Python completion helps to autocomplete some Python functions automatically. Tabular helps on correctly aligning multiple lines and gitguuter helps you with git to see a live gitdiff !!!

Try them, you'll enjoy :-)