---
title: Sphinxdoc and ReadTheDocs theme tricks
author: Deimos
type: post
date: 2014-10-02T10:00:14+00:00
url: /2014/10/02/sphinxdoc-and-readthedocs-theme-tricks-2/
categories:
  - Developement
  - Hi-Tech
  - Web
tags:
  - Developement
  - Hi-Tech
  - Web

---

I'll talk about things that may frustrate you with Sphinxdoc and ReadTheDocs. ReadTheDocs [has a beautiful theme](https://github.com/snide/sphinx_rtd_theme) and you certainly want to use it with Sphinxdoc. However the size of the main text may be too small for you. Or you noticed that when you try to generate a version locally you'll see it works like a charm but when it's compiled on Readthedocs, it will fail.

Here is a solution on how to make it work both locally and on Readthedocs:

{{< highlight python >}}
# on_rtd is whether we are on readthedocs.org, this line of code grabbed from docs.readthedocs.org
on_rtd = os.environ.get('READTHEDOCS', None) == 'True'                           
                                                                                 
if not on_rtd:  # only import and set the theme if we're building docs locally   
    import sphinx_rtd_theme                                                      
    html_theme = 'sphinx_rtd_theme'                                              
    html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]                   
    # Override default css to get a larger width for local build                 
    def setup(app):                                                              
        #app.add_javascript("custom.js")                                         
        app.add_stylesheet('theme_overrides.css')                                
else:                                                                            
    # Override default css to get a larger width for ReadTheDoc build            
    html_context = {                                                             
        'css_files': [                                                           
            'https://media.readthedocs.org/css/sphinx_rtd_theme.css',            
            'https://media.readthedocs.org/css/readthedocs-doc-embed.css',       
            '_static/theme_overrides.css',                                       
        ],                                                                       
    }

{{< /highlight >}}

You may noticed that I'm overriding here CSS files with a custom theme_overrides.css file. This to have a larger width for the main text, here is the css content:

{{< highlight css >}}
.wy-nav-content {
   max-width: 1050px
}
{{< /highlight >}}

The problem with Readthedocs is when you're doing that, you'll loose default CSS. That's why I recall the official CSS themes as well. To see the result, you can check [MySecureShell documentation](http://mysecureshell.readthedocs.org).

Hope this will help you.
