---
title: 'Vagrant: manage Docker + VirtualBox easily'
author: Deimos
type: post
date: 2015-01-08T11:00:02+00:00
url: /2015/01/08/vagrant-manage-docker-virtualbox-easily/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Debian
  - Developement
  - Docker
  - Hi-Tech
  - Linux
  - Red Hat
  - Vagrant
tags:
  - docker
  - vagrant
  - virtualbox

---
![Vagrant-logo](/images/logo_vagrant.png)

As you may know, I'm using [Vagrant](https://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines) for more than a year now with VirtualBox. [Docker](https://wiki.deimos.fr/Docker_:_manage_LXC_containers_easily_with_advanced_features) is a faster alternative that needs to be taken into consideration. Having the possibility to manage both of them with the same tool can be very interesting. For information, I mainly use it with VirtualBox because it's any platform compatible and Docker because it's perfect for a CI like [Jenkins](http://jenkins-ci.org/).

I recently talked about my implication into the [Smash](http://www.usmash.me/) project. I made a Vagrantfile for it. I encounter several problems and it took time for me to resolve them. I'm going to share with you my experience on it. I'm going to describe the Vagrantfile and then, I'll give the full version of it. The first part:

{{< highlight bash >}}# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# You can override those vars by using shell environment vars 
vb_box = (ENV['VAGRANT_VB_BOX'] || 'deimosfr/debian-wheezy')
# Workaround for mitchellh/vagrant#1867 / source: https://groups.google.com/forum/#!topic/vagrant-up/XIxGdm78s4I
if ARGV[1] and \
    (ARGV[1].split('=')[0] == "--provider" or ARGV[2])
    provider = (ARGV[1].split('=')[1] || ARGV[2])
else
    provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || :virtualbox).to_sym
end
{{< /highlight >}}

I'm using here some vars that can be override with Shell environment vars. For example, before launching Vagrant, you can update a default var like this:

{{< highlight bash >}}VAGRANT_VB_BOX="my_atlas_box_name" vagrant up{{< /highlight >}}

Or you can simply export them to keep them in your current session.

The VAGRANT\_DEFAULT\_PROVIDER var is a little bit more complex. I needed to do that because of this part:

{{< highlight bash >}}Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # VirtualBox settings
    if "#{provider}" == "virtualbox"
        config.vm.provider "virtualbox" do |vb|
            config.vm.box = "#{vb_box}"
        end
    end
{{< /highlight >}}

I encountered a problem with Docker provider, because the "config.vm.provider" line is not like a if statement (like I thought at the beginning). That mean the Vagrantfile is fully parsed anytime you call it and all options are set. The problem was on the "config.vm.box" option which was used for Docker provider as well and was overriding the Docker image parameter I was trying to use. This produced a fail resolution of the required image to deploy. That's why I'm using the if statement and had to use a specific var for it.

Now regarding the Docker part:

{{< highlight bash >}}# Docker settings
    if "#{provider}" == "docker"
        config.vm.provider "docker" do |d|
            #d.image = "smash:wheezy_7.7.0-0.1"
            d.build_dir = "."
            d.remains_running = true
            d.has_ssh = true
            config.ssh.username = "root"
            #d.expose = ["22"]
            #d.cmd = ["/usr/sbin/sshd", "-d"]
        end
    end
{{< /highlight >}}

As you can see, some options are commented. That's because I prefer using "d.image" instead of a Dockerfile (d.build_dir) but can't make it work for the moment. I prefer using the commented lines because I can use a use vars with the Vagrantfile instead of a static Dockerfile. However, for an unknow reason (for the moment), I encounter SSH issue when not using the Dockerfile (I'll dig into it and let you know in future a post). So here is the Dockerfile:

{{< highlight bash >}}FROM smash:wheezy_7.7.0-0.1
MAINTAINER Pierre Mavro &lt;pierre@usmash.me&gt;
# Start SSHd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]{{< /highlight >}}

You noticed there is nothing very interesting in it, I mean nothing that Vagrant cannot handle. That's why I need to dig into this last issue. You may notice that I'm using a custom image. This image has been built with a SSH server of course to start it once Vagrant will boot a Docker container. This is necessary to have it if you want to use a provisioner like Ansible (will talk about it in next posts too).

The last part is talking about the machine declaration: 

{{< highlight bash >}}# Web servers
    config.vm.define 'web1' do |machine|
        config.vm.host_name = 'web1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "384"]
        end
        config.vm.network "public_network", :bridge =&gt; 'wlan0'
        config.ssh.forward_agent = true
    end
{{< /highlight >}}

Easy to understand, the web1 machine will be used with a bridged connexion and a certain amount of RAM.

To finish, here is the Vagrantfile with all parts:

{{< highlight bash >}}# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# You can override those vars by using shell environment vars 
vb_box = (ENV['VAGRANT_VB_BOX'] || 'deimosfr/debian-wheezy')
# Workaround for mitchellh/vagrant#1867 / source: https://groups.google.com/forum/#!topic/vagrant-up/XIxGdm78s4I
if ARGV[1] and \
    (ARGV[1].split('=')[0] == "--provider" or ARGV[2])
    provider = (ARGV[1].split('=')[1] || ARGV[2])
else
    provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || :virtualbox).to_sym
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # VirtualBox settings
    if "#{provider}" == "virtualbox"
        config.vm.provider "virtualbox" do |vb|
            config.vm.box = "#{vb_box}"
        end
    end

    # Docker settings
    if "#{provider}" == "docker"
        config.vm.provider "docker" do |d|
            d.build_dir = "."
            d.remains_running = true
            d.has_ssh = true
            config.ssh.username = "root"
        end
    end

    # Web servers
    config.vm.define 'web1' do |machine|
        config.vm.host_name = 'web1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "384"]
        end
        config.vm.network "public_network", :bridge =&gt; 'wlan0'
        config.ssh.forward_agent = true
    end

    # SQL servers
    config.vm.define 'sql1' do |machine|
        config.vm.host_name = 'sql1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        config.vm.network "public_network", :bridge => 'wlan0'
        config.ssh.forward_agent = true
    end

end{{< /highlight >}}

Now if I want to start a VM (web1) with VirtualBox and a SQL (sql1) with Docker, I can do like this:

{{< highlight bash >}}VAGRANT_DEFAULT_PROVIDER="virtualbox" vagrant up web1
VAGRANT_DEFAULT_PROVIDER="docker" vagrant up sql1
{{< /highlight >}}

Easy right ?! :-).
  
Note 1: You do not need to specify this variable for VirtualBox as this is the default one.
  
Note 2: I did not export all Docker required ports etc...because this is not the object of the post here.

Hope you've enjoyed this post. If it's the case, you'll enjoy next ones.
