---
title: 'Docker: why you should use Monit instead of supervisord'
author: Deimos
type: post
date: 2016-01-13T11:00:04+00:00
url: /2016/01/13/docker-why-you-should-use-monit-instead-of-supervisord/
image: /images/logo_docker.png
thumbnailImage: /thumbnails/logo_docker.png
thumbnailImagePosition: left
categories:
  - Docker
  - Hi-Tech
  - Nousmotards
tags:
  - nousmotards

---
![docker-logo](/images/logo_docker.png)
This title can sounds like a troll, but this is not the case! I'm writing this post as a feedback. When I spoke during an Ansible meetup presenting [Nousmotards infrastructure][1], I had several questions regarding why I chose monit as the init system instead of supervisord. That's what encouraged me to write this post and that's why I wanted to clarify here the things.

## Introduction

Docker is made to run a process in a confined area. The problem is when you want to run several processes inside a container! **Docker is simply not designed for it by default and that's why a process manager should be considered**. Docker officially recommend to use [supervisord][2] as the init system. This is why I first started with it. However **I encountered several crashes** with supervisord when a failing managed process occurred and were looping. I also wanted to look at the available options and I was very surprised by **the lack of features compared to Monit**.

## Why Supervisord is a bad idea for Docker?

I decided to switch to he well known Monit and got an **unattended behavior** with the Docker usage there. When you're running a Docker container, you need to define the first command that will be launched and will take the PID 1. This is generally where a process manager like Supervisord or Monit enter in the game. **When you decide to stop a docker container, this will kill the process manager and its forked processes.**

With **supervisord** it works like a charm as it forks the commands it has to manage and those **should not be run in a daemon mode.**
  
**Monit** however **prefers to run services instead as daemon** and check periodically the processes state. This may not be the best method regarding Docker ideology, however this is the best in my opinion. Why ? For several reasons in fact ! Here they are:

  * Did you already run a packaged java application like elasticsearch, Cassandra, Tomcat, etc...? Have you already seen the number of arguments passed when you run this kind of service with Sysv or Systemd? If not, here is an example:

{{< highlight bash >}}
/usr/lib/jvm/java-8-oracle//bin/java -Xms8g -Xmx8g -Djava.awt.headless=true -XX:+UseParNewGC
-XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly
-XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Dfile.encoding=UTF-8 -Delasticsearch
-Des.pidfile=/var/run/elasticsearch/elasticsearch.pid -Des.path.home=/usr/share/elasticsearch
-cp :/usr/share/elasticsearch/lib/elasticsearch-1.7.4.jar:/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/lib/sigar/*
-Des.default.config=/etc/elasticsearch/elasticsearch.yml -Des.default.path.home=/usr/share/elasticsearch
-Des.default.path.logs=/var/log/elasticsearch -Des.default.path.data=/var/lib/elasticsearch
-Des.default.path.work=/tmp/elasticsearch -Des.default.path.conf=/etc/elasticsearch org.elasticsearch.bootstrap.Elasticsearch
{{< /highlight >}}

<p style="padding-left: 30px;">
  <strong>Are you really going to copy/paste all those lines in supervisord to start your process?</strong> What will happen if one of those arguments needs to be changed, as it could be the case during an application life cycle with the package manager of your distribution? Will you always be aware at any changes and update them in consequence? I'm not sure and this is typically a <strong>source of potential issues that can be avoided</strong>. So in Docker, using init scripts services is the best solution in my opinion as you don't have to care about them. You just have to let the distribution/editor choose the best arguments for you and override them in the /etc/default folder as usual if needed.

  * Now if we just compare them outside the Docker scope, what will happen when supervisord completely crashes? You're just **losing all your forked applications in that case**! And what will happen if one of them is a **database**? **In the best case, a recovery scenario will occur to get your data back and it the worst case they are corrupted**. Regarding Monit, it starts demonized services, you can restart it, upgrade it or doing what you want with the Monit process as it is completely not linked with launched process.
  * The **lack of features in supervisord** is a problem as well in my opinion. In Docker, you really need a featured process manager if you want to run several processes. That mean this entry point **should be able to manage boot order, dependencies, retry count, timeout etc...and only Monit is able to do that**.

## Avoid Monit as PID 1

I hope you're now convinced that Monit is a very good candidate to manage processes inside a Docker container. As said, **the first launched command on Docker will take the PID 1**. This is where the main issue is as you may want to restart Monit or upgrade it for an emergency case (because in theory you shouldn't have to touch processes inside your container and deploy a new container instead that will replace the current one). More than that, **when you're going to kill Monit, it won't gracefully shutdown the managed processes**. So **you need to handle the kill signal and perform a stop** on all of them properly. I've made a basic and simple init script for Docker that permit to do it:

{{< highlight bash >}}
#!/bin/bash

# Catch signals
trap "/usr/bin/monit_stop_all_wait.sh ; exit" EXIT

# Monit will start all apps
service monit start

# Stay up for container to stay alive
while [ 1 ] ; do
   sleep 1d
done
{{< /highlight >}}

The kill signal with call another script that will request monit to stop all managed services and wait for them to be stopped before returning:

{{< highlight bash >}}
#!/bin/bash
# Wait for all monit services to be stop before release

total_services=$(monit summary | grep -c "^Process")

command_return=1
while [ $command_return != 0 ] ; do
   sleep 1
   command_return=$(/usr/bin/monit stop all 2&gt;&1 | grep -c "Action failed")
done

while [ $total_services != $(monit summary | grep "^Process" | grep -c "Not monitored") ] ; do
   sleep 1
done
{{< /highlight >}}

## Conclusion

With Monit and those basic scripts, you can have a featured and stable launcher, do emergency things on Monit if necessary and keep it simple by using your distribution init scripts.

I recently discovered another solution that nearly do the same thing like [dumb-init][3]. I personally prefer to keep the most stupid thing but stable.

To finish, I've nothing against Supervisord, this is just not the best appropriate solution for Docker.

 [1]: http://www.meetup.com/fr/Ansible-Paris/events/223572292/
 [2]: https://docs.docker.com/engine/articles/using_supervisord/
 [3]: http://engineeringblog.yelp.com/2016/01/dumb-init-an-init-for-docker.html