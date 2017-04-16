---
title: 'Ceph: setup Rados Block Devices (RBD) nodes on Debian'
author: Deimos
type: post
date: 2014-01-21T11:00:00+00:00
url: /2014/01/21/ceph-setup-block-devices-rbd-nodes-on-debian/
image: /images/logo_ceph.png
thumbnailImage: /thumbnails/logo_ceph.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux
tags:
  - Ceph
  - Debian
  - Hi-Tech
  - Linux

---
![ceph_logo](/images/logo_ceph.png)
In addition of [object storage](http://blog.deimos.fr/?p=4240), **Ceph is able to provide block devices**. Ceph’s **RADOS Block Device (RBD)** provides access to block device images that are striped and replicated across the entire storage cluster.

For example this is used to store Virtual Machines on OpenStack. With that solution, you've got a real **fault tolerance system** for your VM **and distributed**. 

The RBD part is an easy task when you've already setup a Ceph cluster. To see what you can do with, [follow the link](https://wiki.deimos.fr/Ceph_:_performance,_reliability_and_scalability_storage_solution#Use_blocks_device_storage).