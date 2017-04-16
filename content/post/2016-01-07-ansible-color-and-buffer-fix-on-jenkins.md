---
title: Ansible color and buffer fix on Jenkins
author: Deimos
type: post
date: 2016-01-07T15:28:41+00:00
url: /2016/01/07/ansible-color-and-buffer-fix-on-jenkins/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Hi-Tech
  - Jenkins
  - Nousmotards
tags:
  - nousmotards

---
![ansible_logo](/images/logo_ansible.png)
Hi all ! Long time since last blog post ! I'm using Jenkins with Ansible on my [Nousmotards](http://www.nousmotards.com) project for building docker containers or deploying into production.

You may noticed that you've no Ansible color when running it into Jenkins! The simple way to correct it is to export an environment variable in your Jenkins job:

{{< highlight bash >}}
export ANSIBLE_FORCE_COLOR=true
{{< /highlight >}}

Now that's pretty cool! However, you may also noticed that there's some kind of lags on the console when you want to see a real time console log on Jenkins. That's pretty annoying when you're doing rolling upgrades or restart. The solution is once again an environment variable:

{{< highlight bash >}}
export PYTHONUNBUFFERED=1
{{< /highlight >}}

That's nice now, like on a shell display!