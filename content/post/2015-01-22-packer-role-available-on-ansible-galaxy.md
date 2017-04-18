---
title: Packer role available on Ansible Galaxy
author: Deimos
type: post
date: 2015-01-22T11:00:56+00:00
url: /2015/01/22/packer-role-available-on-ansible-galaxy/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Cloud
  - Hi-Tech
tags:
  - Ansible
  - Cloud
  - Hi-Tech

---
![ansible_logo](/images/logo_ansible.png)
Packer is a really great solution to make an image in several formats (VirtualBox, Docker...). I recently wanted to deploy it on a Jenkins server to automatically perform image build with the help of Packer.

That's why I've wrote a Packer role for Ansible really easy to use. You simply have to set (or let them by defaults) vars:

{{< highlight bash >}}# Packer version to install
packer_version: '0.7.5'
# Packer destination folder
packer_destination: '/usr/bin'{{< /highlight >}}

It will install the desired version :-)

You [can find it on the Ansible Galaxy here](https://galaxy.ansible.com/deimosfr/packer/).
