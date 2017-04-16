---
title: 'ReadTheDocs: a hosting documentation solution with GitHub'
author: Deimos
type: post
date: 2014-09-26T10:00:53+00:00
url: /2014/09/26/readthedocs-a-hosting-documentation-solution-with-github/
categories:
  - Hi-Tech
  - Web
tags:
  - git
  - github
  - mysecureshell
  - readthedocs
  - sphinxdoc

---

I recently talked about [Sphinxdoc](http://blog.deimos.fr/?p=5042) and we wanted (still for MySecureShell project) a solution to host our documentation. ReadTheDocs is a very good, free and pretty solution made for Sphinxdoc :-)

![rdt_mss-1024x649](/images/rdt_mss-1024x649.png)

What we liked in addition of the hosting, is the usage with GitHub. You can configure a webhook to your GitHub account to automatically ask ReadTheDocs to build a newer version each time a commit is pushed on your GitHub account.

This makes a powerful solution avoiding several manual interventions! You don't need to worry about:

  * How to push your new documentation to your hosting solution
  * How to manage multiple versions (depending your application version) as it can uses GitHub tags
  * Generate multiple version as it provides html, epub and PDF version
  * Multilanguages as it handle it too!

We're very happy about that solution and thanks a lot ReadTheDocs for hosting [our documentation project](http://mysecureshell.readthedocs.org/en/latest/)!