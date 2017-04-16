---
title: 'Vagrant: provision vms and containers with Ansible'
author: Deimos
type: post
date: 2015-01-13T11:00:15+00:00
url: /2015/01/13/vagrant-provision-vms-and-containers-with-ansible/
image: /images/logo_vagrant.png
thumbnailImage: /thumbnails/logo_vagrant.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
  - Vagrant
  - Virtualization
tags:
  - ansible
  - docker
  - vagrant
  - virtualbox

---
![Vagrant-logo](/images/logo_vagrant.png)

In the last post, I talked about how [to manage Docker and VirtualBox with Vagrant](https://blog.deimos.fr/?p=5290). This post follows the last one, with the integration of Ansible as a provisioner. Once again, I'm using it for the [Smash](http://www.usmash.me/) project.

With Ansible, I made several "group_vars" files containing custom and common information related to the used environment (dev, uat, staging...). This helps to setup different kind of environment easily. Vagrant will help to build images with Ansible deployed inside. Also it will construct on the fly a list of inventory hosts that will be used by Ansible. Let's see what you can get and how!

First, we're taking back the Vagrantfile (like the previous post), but you'll notice some differences due to Ansible:

{{< highlight ruby >}}
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Examples:
# VAGRANT_DEPLOY_ENV='preprod' vagrant up

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# You can override those vars by using shell environment vars 
deploy_env = (ENV['VAGRANT_DEPLOY_ENV'] || 'dev')
vb_box = (ENV['VAGRANT_VB_BOX'] || 'deimosfr/debian-wheezy')
# Workaround for mitchellh/vagrant#1867 / source: https://groups.google.com/forum/#!topic/vagrant-up/XIxGdm78s4I
if ARGV[1] and \
    (ARGV[1].split('=')[0] == "--provider" or ARGV[2])
    provider = (ARGV[1].split('=')[1] || ARGV[2])
else
    provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || :virtualbox).to_sym
end

# Show used vars
puts "==&gt; Using #{provider} provider"
puts "==&gt; Deploying Ansible #{deploy_env} environment"
{{< /highlight >}}

This part include the environment I want to deploy, the provider to use and the Vagrant image box I need to use to launch my VM.

The provider part is simple for VirtualBox as nothing has to be done with most of boxes you can find on Atlas (ex Vagrant Cloud). However, for the Docker provider, you have to be sure that an SSH server is present, started and a Vagrant key is present for the root user (as no Vagrant user exist by default). The Vagrant part should looks like this:

{{< highlight ruby >}}
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Common settings
    config.ssh.insert_key = false
    config.ssh.forward_agent = true

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

{{< /highlight >}}

For the Docker part, I'm using a Dockerfile which looks like this to start SSH server (required for Ansible):

{{< highlight bash >}}
FROM debian:wheezy
# Start SSHd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

{{< /highlight >}}

Regarding the definition of the VM, you need to forward your SSH agent to make it work with Ansible:

{{< highlight ruby >}}
# Web servers
    config.vm.define 'web1' do |machine|
        config.vm.host_name = 'web1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "384"]
        end
        config.vm.network "public_network", :bridge =&gt; 'wlan0'
    end

    # SQL servers
    config.vm.define 'sql1' do |machine|
        config.vm.host_name = 'sql1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        config.vm.network "public_network", :bridge =&gt; 'wlan0'
    end

{{< /highlight >}}

As we're talking about forwarding agent, I had an issue with sudo usage. My goal was to clone a private repository on GitHub. But the agent wasn't forwarded when I was using sudo command. That's why, I got an Ansible playbook rule for it configuring the sudoers file:

{{< highlight yaml >}}
---
- name: Make sure ssh-agent is forwarded via sudo
  lineinfile: dest=/etc/sudoers state=present regexp='^Defaults env_keep\+\=SSH_AUTH_SOCK' line='Defaults env_keep+=SSH_AUTH_SOCK'

{{< /highlight >}}

This line export the environment var "SSH\_AUTH\_SOCK" with sudo. That means, my personal SSH key is forwarded to the VM with Vagrant (with vagrant user) and then is used with root user with the help of sudo. And that's not finished! We have to play with the Ansible provisioner as well to force the key forwarding:

{{< highlight ruby >}}
config.vm.provision "ansible" do |ansible|
        ansible.sudo = true
        ansible.host_key_checking = false
        ansible.raw_ssh_args = ['-o UserKnownHostsFile=/dev/null']
        ansible.playbook = "site.yml"
        #ansible.verbose = 'v'
        #ansible.verbose = 'vvv'
        #ansible.limit = 'web1'
        #ansible.tags = ['smash']
        ansible.groups = {
            'web' =&gt; ['web1'],
            'webapp' =&gt; ['web1'],
            'sql' =&gt; ['sql1']
        }
        ansible.extra_vars = {
            ansible_ssh_user: 'vagrant',
            ansible_connection: 'ssh',
            ansible_ssh_args: '-o ForwardAgent=yes -A',
            set_env: "#{deploy_env}",
        }
    end

{{< /highlight >}}

I'm using sudo for the VirtualBox part and require a vagrant user for Docker. I also don't want to check the host key. The following things related to Ansible should remind you something if you're familiar with it. Regarding the Ansible groups, here is how to help Vagrant to build on the fly the inventory. You have to define your groups and define which server belongs to which group in your default YAML file. Extra vars are used to force Vagrant user to be used and the ForwardAgent to be used (still to clone private repository requiring your private key).

We also need to activate sudo (even with root user) in the Ansible playbook configuration (site.yml):

{{< highlight yaml >}}
---
# All machines
- name: common
  hosts: all
  user: root
  sudo: yes
  roles:
    - common
...

{{< /highlight >}}

The complete Vagrantfile looks like this:

{{< highlight ruby >}}
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Examples:
# VAGRANT_DEPLOY_ENV='preprod' vagrant up

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# You can override those vars by using shell environment vars 
deploy_env = (ENV['VAGRANT_DEPLOY_ENV'] || 'dev')
vb_box = (ENV['VAGRANT_VB_BOX'] || 'deimosfr/debian-wheezy')
# Workaround for mitchellh/vagrant#1867 / source: https://groups.google.com/forum/#!topic/vagrant-up/XIxGdm78s4I
if ARGV[1] and \
    (ARGV[1].split('=')[0] == "--provider" or ARGV[2])
    provider = (ARGV[1].split('=')[1] || ARGV[2])
else
    provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || :virtualbox).to_sym
end

# Show used vars
puts "==&gt; Using #{provider} provider"
puts "==&gt; Deploying Ansible #{deploy_env} environment"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Common settings
    config.ssh.insert_key = false
    config.ssh.forward_agent = true

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
    end

    # SQL servers
    config.vm.define 'sql1' do |machine|
        config.vm.host_name = 'sql1'
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        config.vm.network "public_network", :bridge =&gt; 'wlan0'
    end

    # Deploy ansible playbook
    config.vm.provision "ansible" do |ansible|
        ansible.sudo = true
        ansible.host_key_checking = false
        ansible.raw_ssh_args = ['-o UserKnownHostsFile=/dev/null']
        ansible.playbook = "site.yml"
        #ansible.verbose = 'v'
        #ansible.verbose = 'vvv'
        #ansible.limit = 'web1'
        #ansible.tags = ['smash']
        ansible.groups = {
            'web' =&gt; ['web1'],
            'webapp' =&gt; ['web1'],
            'sql' =&gt; ['sql1']
        }
        ansible.extra_vars = {
            ansible_ssh_user: 'vagrant',
            ansible_connection: 'ssh',
            ansible_ssh_args: '-o ForwardAgent=yes -A',
            set_env: "#{deploy_env}",
        }
    end
end

{{< /highlight >}}

I hope you'll win a lot of time, because I'll loose too much IMO :-p