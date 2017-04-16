---
title: 'Packer: 1 command line to create a Debian VirtualBox/Vagrant box'
author: Deimos
type: post
date: 2014-09-04T10:00:01+00:00
url: /2014/09/04/packer-easily-create-a-debian-virtualboxvagrant-box/
image: /images/logo_packer.png
thumbnailImage: /thumbnails/logo_packer.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Vagrant
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Vagrant

---
![packer_logo](/images/logo_packer.png)
I recently wanted to update my Vagrant box running Debian Wheezy. The problem is, the box size is growing on each updates for several reasons. And **I prefer to create a new box from scratch** on any new Debian release.

Starting from scratch each time is a little bit boring, that's why [I created a preseed file](https://wiki.deimos.fr/Automatiser_une_installation_de_Debian) (french). That made the install automatically, however I always had to do other step by hands (or need to write a script for it).

I remembered to have [tested Packer a few times ago](http://blog.deimos.fr/2014/03/18/packer-win-time-by-easily-testing-your-app-on-multiple-platforms/) and decided to look at the features of the latest version.
  
The last one is good enough to make all I needed. So I started to write a [Packer configuration file (on GitHub)](https://github.com/deimosfr/packer-wheezy) and **now I can build a Vagrant box ready in a few minutes in only one command!**

Do you want to see? First clone the repository:

{{< highlight bash >}}
$ git clone https://github.com/deimosfr/packer-wheezy
{{< /highlight >}}

Then edit _deimosfr_debian-wheezy_ file and adapt the variables fields with the Debian version you want and the ISO sha512 checksum:

{{< highlight javascript >}}
"variables": {
        "debian_version": "7.6.0",
        "iso_checksum": "f8f0e2ddc5bafd5eb4188cca40a7e0acd12be3bb425ce5ad56734df6e807237e8798e61ac6bb07b02056ef7e7621ceba5f84c00449be449005f9c4e47055333f"
    },

{{< /highlight >}}

Once done, create your box file:

{{< highlight bash >}}
$ packer build deimosfr_debian-wheezy
{{< /highlight >}}

That's it :-)

You can find the result on the vagrantcloud here if you only want to get the version built with it: [https://vagrantcloud.com/deimosfr/debian-wheezy](https://vagrantcloud.com/deimosfr/debian-wheezy)

Thanks HashiCorp for Vagrant and Packer :-)
