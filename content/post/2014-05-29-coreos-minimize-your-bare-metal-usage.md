---
title: 'CoreOS: minimize your bare metal usage'
author: Deimos
type: post
date: 2014-05-29T10:00:00+00:00
url: /2014/05/29/coreos-minimize-your-bare-metal-usage/
image: /images/logo_coreos.png
thumbnailImage: /thumbnails/logo_coreos.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Docker
  - Hi-Tech
  - Virtualization
tags:
  - coreos docker

---
![coreos-logo](/images/logo_coreos.png)
> CoreOS is a new Linux distribution that has been rearchitected to provide features needed to run modern infrastructure stacks. The strategies and architectures that influence CoreOS allow companies like Google, Facebook and Twitter to run their services at scale with high resilience. We've implemented them correctly so you don't have to endure the slow, learn-as-you-go infrastructure building process.
> 
> CoreOS can run on your existing hardware or on most cloud providers. Clustering works across platforms, making it easy to migrate parts of your gear over to CoreOS, or to switch cloud providers while running CoreOS.

CoreOS is a volatile distribution with a very small memory footprint. It starts to be very interesting when you combine it with Docker.

A pretty thing of CoreOS is the updates. They are automatically done without interruption (in a cluster) and have an automatic rollback mechanism when it fails! If you configure CoreOS to handle the load balancer (scripts exists for AWS), then it is totally transparent for you and you do not have anything to do.
  
When CoreOS is rebooted or when a node fails, the containers are going offline and migrated to another node in the cluster.

You can install CoreOS in several different ways like ISO, PXE and use etcd in a clustered environment to keep and deploy your configuration in a centralized way.
  
You can then use fleetctl to automatically pull docker images after each boot and systemd to automatically start containers. If you need to install compilers or tools, you can use "toolbox" from Fedora.

If your objective is to use docker on several servers, want HA and scalability, you should consider looking at CoreOS.

 [1]: https://coreos.com/