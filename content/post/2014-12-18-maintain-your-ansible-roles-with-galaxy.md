---
title: Maintain your Ansible roles with Galaxy
author: Deimos
type: post
date: 2014-12-18T11:00:24+00:00
url: /2014/12/18/maintain-your-ansible-roles-with-galaxy/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Hi-Tech
tags:
  - Ansible
  - Hi-Tech

---
![ansible_logo](/images/logo_ansible.png)
If like me, you were using the [Ansible Galaxy website](https://galaxy.ansible.com/) to find and download your playbook for your favorite apps, you may missed a feature. 

It happened to me when I had to manage several playbook roles. I first wanted to use Git submodules to do it. However I preferred to search another way to do like like Puppet can do with [R10K](https://github.com/adrienthebo/r10k) because I am working on a project with some unfamiliar Git users. And I preferred to make it as simple as possible. 

During a short search, I didn't find anything really interesting, and looked at all the informations [on the Galaxy website](https://galaxy.ansible.com/intro). I finally almost find what I was searching for. You can specify a file with role name and version you want to install. The file (galaxy_dep) should looks like this:

{{< highlight bash >}}jdauphant.nginx,v1.1.1
nbz4live.php-fpm,0.2.0
deimosfr.mysql,v0.1
deimosfr.dotdeb,v0.1{{< /highlight >}}

Then you can launch your ansible-galaxy binary with those options to grab your defined roles:

{{< highlight bash >}}ansible-galaxy install -r galaxy_dep -p roles --force{{< /highlight >}}

This will download them in the "roles" folder in the current directory. A missing feature in my opinion is the possibility to rename with a specified name the downloaded roles. 

This is a simple solution but I hope this could help you too.
