---
title: 'Sphinxdoc: easily make a documentation'
author: Deimos
type: post
date: 2014-09-22T10:00:57+00:00
url: /2014/09/22/sphinxdoc-easily-make-a-documentation/
image: /images/Sphinx_Python_Documentation_Logo.png
thumbnailImage: /thumbnails/Sphinx_Python_Documentation_Logo.png
thumbnailImagePosition: left
categories:
  - Developement
  - Hi-Tech
tags:
  - Developement
  - Hi-Tech

---
![Sphinx_Python_Documentation_Logo](/images/Sphinx_Python_Documentation_Logo.png)
I already heard of [Sphinxdoc](http://sphinx-doc.org/) a year ago and see some of my colleges are using it for professional or personal usages. With my friend Sebastien Tardif (Teka101), we decided to rebuild a complete documentation for MySecureShell in a more fashion way as the old doculentation starts looking ugly. Even if it's more an oriented Python solution, it can be used for any other kind of project and we decided to use SphinxDoc to make a newer documentation.

Sphinxdoc use markup language which **makes it simple and clear to
   
build a documentation**. But the biggest pros are the output possibilities! Once your documentation is written, you can export it in several format:

  * **html**: to make standalone HTML files
  * **singlehtml**: to make a single large HTML file
  * **epub**: to make an epub
  * **latex**: to make LaTeX files, you can set PAPER=a4 or PAPER=letter
  * **latexpdf**: to make LaTeX files and run them through pdflatex
  * **man**: to make manual pages
  * **changes**: to make an overview of all changed/added/deprecated items
  * ...

More than that, you can comment your code project and ask Sphinxdoc to generate a documentation from your code comments! There are a lot of interesting features and **I strongly recommend it** if you want to make a beautiful documentation easily.

If you want to look at what a documentation source looks like, [you can check at the MySecureShell project](https://github.com/mysecureshell/mysecureshell/tree/master/doc). Now if you want to look at what does the new documentation looks like, [you can check here](http://mysecureshell.readthedocs.org/en/latest/) (not fully finished yet).

![rdt_mss-1024x649](/images/rdt_mss-1024x649.png)

I hope you'll test it after reading this :-)

 [1]: http://mysecureshell.readthedocs.org/en/latest/