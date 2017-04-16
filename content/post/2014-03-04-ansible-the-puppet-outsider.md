---
title: 'Ansible: the Puppet outsider!'
author: Deimos
type: post
date: 2014-03-04T11:00:36+00:00
url: /2014/03/04/ansible-the-puppet-outsider/
rating:
  - 4
votes:
  - 1
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Puppet
  - Red Hat

---
![ansible_logo-300x300](/images/logo_ansible.png)

It's been a while now that I've heard of [Ansible](http://www.ansible.com) but I only started playing with a week ago. You may certainly know that I'm a Puppet lover, but **this solution is more powerful than Puppet** in my opinion.

So I started to migrate my personal Puppet to Ansible just to play with. Here are the pros:

  * **No client needed** on the clients, only SSH!
  * It's written in Python
  * **By default a lot of modules**
  * Not only a configuration management tool, **it's an orchestrator too**!
  * Can handle **scenario**
  * Easy YAML language!

For the cons:

  * Not enough community yet, but **growing very fast**
  * Not as much modules as Puppet now

And this is enough for me to switch! I also already heard of SaltStack which is an outsider too, but it's unfortunately not agentless and as far as I know (not verified) you can't create scenarios.

To conclude, test Ansible, it's awesome!