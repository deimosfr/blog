---
title: Do you want to try my desktop configuration ?
author: Deimos
type: post
date: 2013-08-04T10:00:37+00:00
url: /2013/08/04/do-you-want-to-try-my-dektop-configuration/
categories:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - Others
  - Private life
tags:
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - Others
  - Private life

---
![awesome_desktop-1024x640](/images/awesome_desktop-1024x640.png)

Some of you already told me how complicated the setup of my software configurations could be. Depending on which configuration you're talking about, it may be more or less complicated to install in the good folders, launching the good commands etc...

In addition, sometimes I need to set up a quick desktop environment with my preferences and deploy all I need may take a while. That's why I've written some scripts (in Python and shell script) to help on deploying all my configuration and all the packages I wish. Those scripts are not perfect but they do the job and could be reused for any other usages.

Do you want to try ? Ok, you'll see, it's quick. You can use a VM with [Vagrant](http://wiki.deimos.fr/Vagrant_:_quickly_deploy_virtual_machines) (here is what I'll do with VirtualBox) or simply use it a dedicated machine. I forgot to mention that this automation script is only for Debian and have only been tested on Stable/Unstable (Testing works with stable repo in addition).

Let's start now with downloading a wheezy vagrant box and start it :

{{< highlight bash >}}
vagrant box add wheezy https://www.dropbox.com/s/gpagp78g4mye1l7/wheezy.box
vagrant init wheezy
vagrant up
{{< /highlight >}}

Then connect to the machine, configure your locales, download the script and launch it :

{{< highlight bash >}}
vagrant ssh
sudo dpkg-reconfigure locales
wget -O install_config.sh "https://git.deimos.fr/?p=git_deimosfr.git;a=blob_plain;f=user_config/install_config/install_config.sh;hb=HEAD"
bash install_config.sh
{{< /highlight >}}

You'll now be able to configure and install specific configurations :

![config_soft](/images/config_soft.png)

and then install bundle of packages :

![install_group_packages](/images/install_group_packages.png)

The list of packages could be easily changed by [editing that file](https://git.deimos.fr/?p=git_deimosfr.git;a=blob_plain;f=user_config/install_config/install_config/packages_list;hb=HEAD) :

{{< highlight bash >}}
# minimal tools
zsh
tmux
vim
htop
apt-file
linux-non-free

# console extra
wicd-curses
...
{{< /highlight >}}

The first hash tag followed by a name, is the group package/bundle name ("console extra" for example) and then the list of packages that belongs to that group. If you need to set comments, simply double the hash tag.

When finished, reboot if needed (if you've installed the gui part) to see the result :-). You can login with "vagrant" user and password by default.
