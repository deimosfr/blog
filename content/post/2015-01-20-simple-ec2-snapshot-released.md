---
title: Simple EC2 snapshot released !
author: Deimos
type: post
date: 2015-01-20T11:00:12+00:00
url: /2015/01/20/simple-ec2-snapshot-released/
image: /images/logo_amazon-aws.jpg
thumbnailImage: /thumbnails/logo_amazon-aws.jpg
thumbnailImagePosition: left
categories:
  - Cloud
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Cloud
  - Debian
  - Developement
  - Hi-Tech
  - Linux
  - Red Hat

---
![amazon-aws-logo](/images/logo_amazon-aws.jpg)
For my company, I recently had to find a good solution to make Snapshots from Instance IDs or from tags on AWS. I made several searches but unfortunately didn't find what I was searching for.

That's why I started to make a tool to do this kind of job. It's written in Python and requires the Boto library. Here is what you can do with Simple EC2 snapshots:

<ul class="task-list">
  <li>
    <strong>Hot snapshots</strong> (by default) and Cold snapshots
  </li>
  <li>
    <strong>Multiple instances snapshot in one line</strong>
  </li>
  <li>
    Detection of doubles
  </li>
  <li>
    <strong>Filters by tags (allowing wildcards)</strong> or by instance IDs
  </li>
  <li>
    <strong>Credentials</strong> file multiple with <strong>profiles</strong>
  </li>
  <li>
    Limit the number of snapshots
  </li>
  <li>
    Restrict snapshots to data disks only
  </li>
</ul>

The tool is open source and [can be downloaded on GitHub](https://github.com/enovance/simple_ec2_snapshot) :-). I-d like to thanks my RedHat/eNovance colleagues for different kind of contributions (code, testing, features purpose, etc...)

More features are already planned and should be ready in a few days!!

I hope you'll enjoy it too :-)
