---
title: 'Ansible: my first playbook is for LXC'
author: Deimos
type: post
date: 2014-05-15T10:00:00+00:00
url: /2014/05/15/ansible-my-first-playbook-is-for-lxc/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux

---
![ansible_logo](/images/logo_ansible.png)
I started to play with Ansible a little bit more than a week ago and I really enjoy it compared to [Puppet](https://wiki.deimos.fr/Puppet_:_Solution_de_gestion_de_fichier_de_configuration). I still do not have all my reflex that I can have on Puppet, however what I can say is how easy it is to start making complicated things on Ansible!

I started to rewrite my Puppet manifests to Ansible playbooks and what I can say is it's really fast and easy. The first playbook I made is for [LXC](https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers) as not one existed in the [Ansible Galaxy](https://galaxy.ansible.com).

You can find my [LXC playbook here](https://galaxy.ansible.com/list#/roles/880), and install it like that:

{{< highlight bash >}}ansible-galaxy install deimosfr.lxc
{{< /highlight >}}

I hope you'll enjoy it :-)
