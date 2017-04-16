---
title: Easily deploy Ceph Cluster with Ansible
author: Deimos
type: post
date: 2014-03-06T11:00:00+00:00
url: /2014/03/06/ceph-deploy-it-with-ansible/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Ansible
  - Ceph
  - Hi-Tech
tags:
  - Ansible
  - Ceph
  - Hi-Tech

---
![ansible_logo](/images/logo_ansible.png)
One of my colleague ([Sebastien Han](https://twitter.com/sebastien_han)) started to play (like me) with Ansible. As he is a Ceph master, he often deploy Ceph for tests or production. He generally uses Puppet for that purpose.

But due to some Puppet limitations or big brain fuck it involves, he started to play with Ansible and created a Ceph module for it. He showed me it, when he was writing it and it seamed working like a charm.

He recently finished writing this module and hope it will be available mainstream. You can find his Ansible Ceph module here and [a tutorial on Sebastien's blog](http://www.sebastien-han.fr/blog/2014/03/03/Announcing-ceph-ansible-playbooks/).

I hope you'll test it and understand the power of Ansible and Ceph if it's not already the case.