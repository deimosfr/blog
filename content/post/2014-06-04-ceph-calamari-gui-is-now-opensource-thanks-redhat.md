---
title: 'Ceph: cluster GUI is now OpenSource!!! Thanks RedHat'
author: Deimos
type: post
date: 2014-06-04T10:00:41+00:00
url: /2014/06/04/ceph-calamari-gui-is-now-opensource-thanks-redhat/
categories:
  - Ceph
  - Hi-Tech
tags:
  - Ceph
  - Hi-Tech

---

This is a very good news if you're using Ceph in production! Originally delivered as a proprietary dashboard included with Inktank Ceph Enterprise, Calamari has some really great visualization stuff for your cluster as well as the long term goal of being the all-in-wonder management system that can configure and analyze a Ceph cluster.

Calamari is composed in 2 elements:

  1.  [Backend](https://github.com/ceph/calamari): the Calamari backend is written in Python 2.6+, using Saltstack, ZeroRPC, gevent, Django, django-rest-framework, graphite, (and a few others I may have forgotten) and instantiates a new REST API for integration with other systems. This is an important distinction because earlier versions of Calamari were based on the Ceph REST API. The new Calamari REST API is designed to be much more comprehensive and should be the basis for new development efforts that wish to interact with a Ceph cluster.
  2.  [Frontend](https://github.com/ceph/calamari-clients): the Calamari frontend is a web browser UI implemented primarily in Javascript that uses the Calamari REST API.

![ceph-Main_Dashboard-300x215](/images/ceph-Main_Dashboard-300x215.png)

Big thanks to Redhat for releasing it OpenSource :-)

Source: [Ceph blog](http://ceph.com/community/ceph-calamari-goes-open-source/)