---
title: Which configuration management tool should you use?
author: Deimos
type: post
date: 2014-11-17T11:00:20+00:00
url: /2014/11/17/which-configuration-management-tool-should-you-use/
image: https://wiki.deimos.fr/images/e/ef/Puppet-short.png
categories:
  - Ansible
  - Hi-Tech
  - Linux
  - Puppet
tags:
  - Ansible
  - Hi-Tech
  - Linux
  - Puppet

---

First of all I will only talk about open sources solutions. I don't want to take part of any commercial one. In addition, I will focus on only 4 solutions which seem to me the most used at this time. I will also talk about my history, my level on each one and why I recommend or not that solution.

![Puppet-short](https://wiki.deimos.fr/images/e/ef/Puppet-short.png)

Puppet is in my opinion the most known solution. Because of the marketing they were/are doing, because it was a good alternative compared to the old cfengine. I'm now using Puppet for about 6 years. I felt in love with that solution when I first used it to configure Solaris servers I had to manage. That simplified my life a lot at this time. Things done were simple, **the DSL was light**, but gave me a solution to avoid forgetting to configure things on a fresh server installation. Puppet needs a lot of time to be familiar with the DSL but once done, you'll win time. I had to rewrite from scratch a Puppet master when I switched to RedHat to make better manifests. I enjoyed doing it and you can find a big part of that job on my [wiki](https://wiki.deimos.fr/Puppet_:_Solution_de_gestion_de_fichier_de_configuration). However there is no Hiera because it wasn't out at this time. I waste time as well because stdlib didn't exist and I had to write my own lib :-/.

I really like Puppet but there are several bad points in my opinion:

  * You need an **agent on all your servers**
  * The connexion is between client to server and it can't be reversed. It's a shame for DMZ and it makes things complicated if you're using cloud with the Puppet master out of the cloud.
  * The catalog compilation is slow (even better with PuppetDB when you start having a lot of modules to use)
  * **Ruby has to be installed on every servers** which is not the default case today.
  * You need to deploy a lot of things and use a lot of tool to get all features (stdlib, PuppetDB, Dashboard, Hiera (now builtin), mcollective...)
  * You're restricted to the DSL and need to do ugly tricks to get out of it.

Puppet is a good solution, but if I had to write something from scratch, I won't choose that solution.

![OC_Chef_Logo-300x236](/images/logo_chef.png)

This part won't be longer because I have not a real experience on it. It appeared approximately at the same time of Puppet, it's written in Ruby as well BUT **there is no DSL**! And that's what I like in it. Just write your receipts in ruby and **call Chef methods when you need**. This is a better approach in my opinion.

So today if I had to choose between Puppet and Chef, it would be hard because of the tone of available modules in the Puppet Forge. There are unfortunately more company that invested in Puppet than Chef (like Cisco or VMware). What I recommend in that case is: if you do no need a lot of specific module, use Chef to be more flexible, instead use Puppet if you don't need that flexibility and can satisfy with available modules.

![SaltStack-logo-black-on-white-300x187](/images/logo_saltstack.png)

I'm not familiar with this one neither but read enough article and met enough familiar users with this technology to know that it's a good outsider. The feedbacks I had are:

  * **More flexible** than Puppet
  * Written in Python
  * Lot of available modules (big community)
  * Use YAML configuration
  * Connexion way can be from client to server or server to client.
  * **Orchestration** integrated

This solution looks like very interesting but requires unfortunately a lot of dependencies to install on your client servers. Salt is a new generation configuration management tool with a strong community.

![ansible_logo-300x300](/images/logo_ansible.png)

This is my favorite. I love Ansible and totally replaced Puppet with it on my personal infrastructure. Here is what I like:

  * **Very small dependencies**
  * **Agentless** :-)
  * Use **SSH**
  * YAML configuration
  * Easy to understand and write playbooks
  * Usable as a Python library
  * **Orchestration** integrated
  * Lot of modules by default

Ansible is very easy to use, you'll learn it in a very short time, you can do complicated things without having to write a lot of lines. Ansible is very flexible and I really like that solution. I'm using it for about 6 months now, [wrote several Playbook](https://github.com/search?q=user%3Adeimosfr+ansible) (for ElasticSearch/Kibana/Fluentd, Naemon...) and if I have the choice between all those 4 solutions, I use Ansible without any hesitations! I've recently been to OpenStack summit and a lot of people were talking about using it to deploy OpenStack which sounds the best option. Ansible and SaltStack are the outsiders! Ansible is the youngest solution but the most promising in my humble opinion.

My conclusion is, there is no good or bad solution. They all have their pros and cons. Some are old and stable while others outsiders are young, easier and more flexible. You've understood that I prefer Ansible for several reasons and I really think this will be a major actor in the next years.

I hope this will gives you enough weight to choose the best solution for your needs.