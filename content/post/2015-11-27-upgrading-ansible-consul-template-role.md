---
title: Upgrading Ansible Consul Template role
author: Deimos
type: post
date: 2015-11-27T21:34:03+00:00
url: /2015/11/27/upgrading-ansible-consul-template-role/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Cloud
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Ansible
  - Cloud
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---
![ansible_logo](/images/logo_ansible.png)
As I wanted to upgrade it and because it has been asked several time, I upgraded the consul-template Ansible role to manage official binaries (and upgrades). Here are the new vars:

{{< highlight yaml >}}
consul_template_version: '0.11.0'
consul_template_arch: 'linux_amd64'
consul_template_http_src: "https://github.com/hashicorp/consul-template/releases/download/v{{consul_template_version}}/consul_template_{{consul_template_version}}_{{consul_template_arch}}.zip"
{{< /highlight >}}

You can of course find the role to Ansible Galaxy: [https://galaxy.ansible.com/deimosfr/consul-template/](https://galaxy.ansible.com/deimosfr/consul-template/)

I hope you'll enjoy this new version :-)
