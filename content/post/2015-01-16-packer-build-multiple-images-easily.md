---
title: 'Packer: build multiple images easily'
author: Deimos
type: post
date: 2015-01-16T11:00:52+00:00
url: /2015/01/16/packer-build-multiple-images-easily/
image: /images/logo_packer.png
thumbnailImage: /thumbnails/logo_packer.png
thumbnailImagePosition: left
categories:
  - Ansible
  - Debian
  - Docker
  - Hi-Tech
  - Linux
  - Red Hat
  - Virtualization
tags:
  - ansible
  - debian
  - docker
  - packer
  - virtualbox

---
![packer](/images/logo_packer.png)
Packer is one of the tools [I've used in the past](http://blog.deimos.fr/2014/03/18/packer-win-time-by-easily-testing-your-app-on-multiple-platforms/) to build VirtualBox boxes. You can find what I've done [on my GitHub account](https://github.com/deimosfr/packer-wheezy).

For [Smash](http://www.usmash.me/) project, I wanted to make a packer configuration to manage Docker and VirtualBox. I also wanted to call Ansible to build specific images for each needs. The goal is to be able to build cloud image ready to start, without any special dependencies. This because I need different usages:

  * Production: multiple images for the cloud (VM/Container)
  * CI: multiple images using Docker
  * Dev: multiple images using Docker or VirtualBox

I did not started to manage the cloud provider for the moment as I'm not sure which one I'll be using. Anyway it won't be complicated as the biggest part has been done here. First of all, I declared the default vars in the Packer file:

{{< highlight javascript >}}
{
    "variables": {
        "debian_version": "7.7.0",
        "iso_checksum": "5cb6e4fea55fbb5173f90c3a545b843c6c193e29c3aa32b3306c9bbdfb1ad6a6a36ae8be50e91af9d03d5f21c472bd05d04d3508172e0b519e76714333c7c74b",
        "ansible_inventory_file": "ansible_inventory_file",
        "ansible_environment": "dev",
        "soft_version": "noversion"
    },

{{< /highlight >}}

Here I specified the Debian version which will be automatically downloaded by Packer (for VirtualBox). Then the Ansible inventory file which is containing the group of hosts where the generated image will belong to. Example:

{{< highlight ini >}}
[web]
127.0.0.1

[webapp]

#[sql]
#127.0.0.1

{{< /highlight >}}

Then we are declaring the 2 builders. The first one for VirtualBox and the second for Docker:

{{< highlight javascript >}}
"builders": [
    {
      "type": "virtualbox-iso",
      "boot_command": [
        "&lt;esc&gt;&lt;wait&gt;",
...
      "vboxmanage": [
        [ "modifyvm", "{{.Name}}", "--memory", "512" ],
        [ "modifyvm", "{{.Name}}", "--cpus", "1" ]
      ]
    },
    {
      "type": "docker",
      "image": "debian:wheezy",
      "export_path": "debian.tar"
    }
  ],

{{< /highlight >}}

We're calling here the desired version of Debian image in the variables. The automated installation of VirtualBox is ensured by Debian [preseed.](https://github.com/deimosfr/packer-wheezy/blob/master/http/preseed.cfg) VirtualBox will also pass required args to Debian grub boot for preseed. Regarding Docker, it's simpler as it will automatically pull from the official Docker repository the required distribution.

Then you need to use post processor to request the output format from Packer. Here for VirtualBox, I require an export in a .box format with a maximum compression level. And for Docker, I add the image locally to my  list of images:

{{< highlight javascript >}}
"post-processors": [
    {
      "type": "vagrant",
      "compression_level": "9",
      "output": "wheezy_{{user `debian_version`}}-{{user `soft_version`}}.box",
      "only": ["virtualbox-iso"]
    },
    {
      "type": "docker-import",
      "repository": "smash",
      "tag": "wheezy_{{user `debian_version`}}-{{user `soft_version`}}",
      "only": ["docker"]
    }
  ],

{{< /highlight >}}

Regarding the provisioner part, the way to call VirtualBox scripts and Docker are different. VirtualBox uses sudo command while Docker doesn't need it. As you can see, I'm executing several scripts (some are the same and others are specific):

{{< highlight javascript >}}
"provisioners": [
    {
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -E -S bash '{{.Path}}'",
      "scripts": [
        "scripts/update.sh",
        "scripts/sshd.sh",
        "scripts/networking.sh",
        "scripts/ansible_prequesites.sh",
        "scripts/sudoers.sh",
        "scripts/vagrant.sh",
        "scripts/vbaddguest.sh",
        "scripts/ansible_bin.sh"
      ],
      "only": ["virtualbox-iso"]
    },
    {
      "type": "shell",
      "scripts": [
        "scripts/update.sh",
        "scripts/sshd.sh",
        "scripts/networking.sh",
        "scripts/ansible_prequesites.sh",
        "scripts/sudoers.sh",
        "scripts/vagrant.sh",
        "scripts/ansible_bin.sh"
      ],
      "only": ["docker"]
    },
    {
        "type": "ansible-local",
        "playbook_dir": "..",
        "playbook_file": "../site.yml",
        "inventory_file": "{{user `ansible_inventory_file`}}",
        "extra_arguments": ["-e", "set_env={{user `ansible_environment`}}", "-v"]
    },
    {
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -E -S bash '{{.Path}}'",
      "scripts": [
        "scripts/cleanup.sh"
      ],
      "only": ["virtualbox-iso"]
    },
    {
      "type": "shell",
      "scripts": [
        "scripts/cleanup.sh"
      ],
      "only": ["docker"]
    }
  ]
}

{{< /highlight >}}

Ansible is also executed to create a complete image (and specific vars can be added). Of course this is a little bit boring to create a new image on every release (but can be automated), however when your goal is to auto-scale your images in a cloud environment, it's relevant to be not dependent of tier party applications (GitHub, Apt/Yum repo etc...). That's why this solution is better in my opinion.

If you're wondering what the scripts are doing:

  * "scripts/update.sh": install curl

{{< highlight bash >}}
#!/bin/bash
apt-get update
# install curl to fix broken wget while retrieving content from secured sites
apt-get -y install curl
{{< /highlight >}}

  * "scripts/sshd.sh": install SSH and set 2 options

{{< highlight bash >}}
#!/bin/bash
apt-get -y install openssh-server
echo "UseDNS no" &gt;&gt; /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" &gt;&gt; /etc/ssh/sshd_config

{{< /highlight >}}

  * "scripts/networking.sh": reset network device interface name

{{< highlight bash >}}
#!/bin/bash
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm /lib/udev/rules.d/75-persistent-net-generator.rules
rm -rf /dev/.udev/ /var/lib/dhcp/*
echo "pre-up sleep 2" &gt;&gt; /etc/network/interfaces

{{< /highlight >}}

  * "scripts/ansible_prequesites.sh": install prerequisite for any Ansible client

{{< highlight bash >}}
# Ansible prequesites
apt-get -y install python ruby ruby-json facter ohai

{{< /highlight >}}

  * "scripts/sudoers.sh": install sudo and give to vagrant user all privileges

{{< highlight bash >}}
#!/bin/bash
apt-get -y install sudo
# Set up password-less sudo for user vagrant
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' &gt; /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant
# no tty
echo "Defaults !requiretty" &gt;&gt; /etc/sudoers

{{< /highlight >}}

  * "scripts/vagrant.sh": create vagrant user and add vagrant public key to vagrant user (for VirtualBox) and to root user (for Docker)

{{< highlight bash >}}
#!/bin/bash

### WARNING: DO NOT FORGET TO REMOVE IT IF ACCESSIBLE FROM OUTSIDE !!!

function add_vagrant_key {
    homedir=$(su - $1 -c 'echo $HOME')
    mkdir -p $homedir/.ssh
    curl -L 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -o $homedir/.ssh/authorized_keys2
    chown -Rf $1. $homedir/.ssh
    chmod 700 $homedir/.ssh
    chmod 600 $homedir/.ssh/authorized_keys2
}

if [ $(grep -c vagrant /etc/passwd) == 0 ] ; then
    useradd vagrant -m
fi

# Add public key to vagrant user
add_vagrant_key vagrant
# Needed for vagrant provider using docker
add_vagrant_key root

{{< /highlight >}}

  * "scripts/ansible_bin.sh": install Ansible to be able to run playbooks locally

{{< highlight bash >}}
#!/bin/bash

# Install backports for wheezy
if [ $(grep -c "^7\." /etc/debian_version) == 1 ] ; then
    echo "deb http://http.debian.net/debian wheezy-backports main" &gt; /etc/apt/sources.list.d/backports.list
    apt-get update
fi
# Install Ansible
apt-get -y install ansible
touch /var/log/ansible.log
chown vagrant. /var/log/ansible.log

{{< /highlight >}}

  * "[scripts/vbaddguest.sh](https://github.com/deimosfr/packer-wheezy/blob/master/scripts/vbaddguest.sh)": install virtualbox guests additions
  * "[scripts/cleanup.sh](https://github.com/deimosfr/packer-wheezy/blob/master/scripts/cleanup.sh)": cleanup script to reduce the VM/container size

Now we're ready to play ! You can have a variables file that will override the default set vars in your Packer file. Example:

{{< highlight javascript >}}
{
    "debian_version": "7.7.0",
    "iso_checksum": "5cb6e4fea55fbb5173f90c3a545b843c6c193e29c3aa32b3306c9bbdfb1ad6a6a36ae8be50e91af9d03d5f21c472bd05d04d3508172e0b519e76714333c7c74b",
    "ansible_inventory_file": "ansible_inventory_file",
    "ansible_environment": "prod",
    "soft_version": "0.1"
}
{{< /highlight >}}

Now if I want to create an exported VirtualBox .box with default vars, I only have to run:

{{< highlight bash >}}
packer build -only=virtualbox-iso packerfile

{{< /highlight >}}

And if I want a Docker container added to your images with my custom vars:

{{< highlight bash >}}
packer build -only=docker -var-file=packer_vars packerfile

{{< /highlight >}}

If you do not specify an output format, it will build both in parallel :-)

Here is the complete packerfile:

{{< highlight javascript >}}
{
    "variables": {
        "debian_version": "7.7.0",
        "iso_checksum": "5cb6e4fea55fbb5173f90c3a545b843c6c193e29c3aa32b3306c9bbdfb1ad6a6a36ae8be50e91af9d03d5f21c472bd05d04d3508172e0b519e76714333c7c74b",
        "ansible_inventory_file": "ansible_inventory_file",
        "ansible_environment": "dev",
        "soft_version": "noversion"
    },
  "builders": [
    {
      "type": "virtualbox-iso",
      "boot_command": [
        "&lt;esc&gt;&lt;wait&gt;",
        "install &lt;wait&gt;",
        "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg &lt;wait&gt;",
        "debian-installer=en_US &lt;wait&gt;",
        "auto &lt;wait&gt;",
        "locale=en_US &lt;wait&gt;",
        "kbd-chooser/method=us &lt;wait&gt;",
        "keyboard-configuration/xkb-keymap=us &lt;wait&gt;",
        "netcfg/get_hostname={{ .Name }} &lt;wait&gt;",
        "netcfg/get_domain=vagrantup.com &lt;wait&gt;",
        "fb=false &lt;wait&gt;",
        "debconf/frontend=noninteractive &lt;wait&gt;",
        "console-setup/ask_detect=false &lt;wait&gt;",
        "console-keymaps-at/keymap=us &lt;wait&gt;",
        "&lt;enter&gt;&lt;wait&gt;"
      ],
      "boot_wait": "10s",
      "disk_size": 32768,
      "guest_os_type": "Debian_64",
      "headless": true,
      "http_directory": "http",
      "iso_checksum": "{{user `iso_checksum`}}",
      "iso_checksum_type": "sha512",
      "iso_url": "http://cdimage.debian.org/cdimage/release/{{user `debian_version`}}/amd64/iso-cd/debian-{{user `debian_version`}}-amd64-netinst.iso",
      "ssh_username": "vagrant",
      "ssh_password": "vagrant",
      "ssh_port": 22,
      "ssh_wait_timeout": "10000s",
      "shutdown_command": "echo 'vagrant'|sudo -S /sbin/shutdown -hP now",
      "guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
      "virtualbox_version_file": ".vbox_version",
      "vm_name": "debian-{{user `debian_version`}}-amd64",
      "vboxmanage": [
        [ "modifyvm", "{{.Name}}", "--memory", "512" ],
        [ "modifyvm", "{{.Name}}", "--cpus", "1" ]
      ]
    },
    {
      "type": "docker",
      "image": "debian:wheezy",
      "export_path": "debian.tar"
    }
  ],
  "post-processors": [
    {
      "type": "vagrant",
      "compression_level": "9",
      "output": "wheezy_{{user `debian_version`}}-{{user `soft_version`}}.box",
      "only": ["virtualbox-iso"]
    },
    {
      "type": "docker-import",
      "repository": "smash",
      "tag": "wheezy_{{user `debian_version`}}-{{user `soft_version`}}",
      "only": ["docker"]
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -E -S bash '{{.Path}}'",
      "scripts": [
        "scripts/update.sh",
        "scripts/sshd.sh",
        "scripts/networking.sh",
        "scripts/ansible_prequesites.sh",
        "scripts/sudoers.sh",
        "scripts/vagrant.sh",
        "scripts/vbaddguest.sh",
        "scripts/ansible_bin.sh"
      ],
      "only": ["virtualbox-iso"]
    },
    {
      "type": "shell",
      "scripts": [
        "scripts/update.sh",
        "scripts/sshd.sh",
        "scripts/networking.sh",
        "scripts/ansible_prequesites.sh",
        "scripts/sudoers.sh",
        "scripts/vagrant.sh",
        "scripts/ansible_bin.sh"
      ],
      "only": ["docker"]
    },
    {
        "type": "ansible-local",
        "playbook_dir": "..",
        "playbook_file": "../site.yml",
        "inventory_file": "{{user `ansible_inventory_file`}}",
        "extra_arguments": ["-e", "set_env={{user `ansible_environment`}}", "-v"]
    },
    {
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -E -S bash '{{.Path}}'",
      "scripts": [
        "scripts/cleanup.sh"
      ],
      "only": ["virtualbox-iso"]
    },
    {
      "type": "shell",
      "scripts": [
        "scripts/cleanup.sh"
      ],
      "only": ["docker"]
    }
  ]
}

{{< /highlight >}}

Thanks again to Hashicorp and hope you enjoyed explanations !