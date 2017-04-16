---
title: Vagrant and Ansible are out in version 1.6
author: Deimos
type: post
date: 2014-05-07T10:00:25+00:00
url: /2014/05/07/vagrant-and-ansible-are-out-in-version-1-6/
categories:
  - Ansible
  - Docker
  - Hi-Tech
  - Linux
  - Vagrant
  - Virtualization
tags:
  - Ansible
  - Docker
  - Hi-Tech
  - Linux
  - Vagrant
  - Virtualization

---
![ansible_logo-300x300](/images/logo_ansible.png)


Vagrant and Ansible are out in version 1.6! They are both bringing new super features.

For Vagrant, each major versions are bringing incredible features, this time they are:

  * _Global Status and Control_: Global Status shows you the status of all created Vagrant environments on your machine. **Global Control lets you control any of these created environments from anywhere on your machine**. You unfortunately need to have VM created under 1.6 version to work with that feature :-(
  * _Windows Guests_: Windows is now a first-class officially supported guest OS for Vagrant, meaning **you can now vagrant up development environments running on Windows**.
  * _Docker-Based Development Environments_: This allows Vagrant to run development environments within Linux containers powered by Docker, rather than virtual machines. This is an interesting feature if you can't directly run Docker directly on your machine (Mac and Windows for example)

Now Ansible. I started using it last week and I really love it. I will make a post for it with example. Here are some new features of the version 1.6:

  * **_Gathering facts_**: you can disable it directly in the configuration now
  * Multiple users can connect with different keys
  * Added **VMWare support** with the vsphere_guest module
  * More than **30 new plugins** added

I would like this kind of updates anytime :-)
