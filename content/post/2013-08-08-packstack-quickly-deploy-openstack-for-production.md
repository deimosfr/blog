---
title: 'PackStack : quickly deploy OpenStack for production'
author: Deimos
type: post
date: 2013-08-08T10:00:04+00:00
url: /2013/08/08/packstack-quickly-deploy-openstack-for-production/
categories:
  - Debian
  - Hi-Tech
  - Linux
  - OpenStack
  - Puppet
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - OpenStack
  - Puppet
  - Red Hat

---
![openstack](/images/logo_openstack.png)

Last week, I've assisted to a webinar organized by [Puppet Labs](https://puppetlabs.com/). The talk was about [PackStack](http://wiki.openstack.org/Packstack) which is a solution to deploy [OpenStack](http://www.openstack.org/) in a production environment.

How does PackStack works ? Some of you may tell me that [DevStack](http://wiki.deimos.fr/DevStack_:_d%C3%A9velopper_ou_tester_rapidement_OpenStack) do the same thing. But I warn once again about DevStack which is absolutely not build for production usages ! PackStack is a bundle of current modules for OpenStack available on [Puppet Forge](https://forge.puppetlabs.com/). But to simplify the usage of all those modules, some python scripts come witch a configuration file, which will generate all Puppet manifests. Then the installation and configuration of OpenStack will then be done through SSH.

I've tested OpenStack Grizzly deployment on a CentOS 6.4 with [RDO](http://openstack.redhat.com/) and it works like a charm. For those who don't know what is RDO, it's a community of people using and deploying OpenStack on Red Hat and Red Hat-based platforms.

A lot of work remains anyway and eNovance will certainly participate for Debian deployment as well (still in discussion). I hope this will be the solution to simplify installation process for OpenStack.