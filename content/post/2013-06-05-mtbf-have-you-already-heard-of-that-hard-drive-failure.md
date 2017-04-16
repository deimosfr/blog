---
title: 'MTBF : have you already heard of that ? (Hard drive failure)'
author: Deimos
type: post
date: 2013-06-05T10:00:55+00:00
url: /2013/06/05/mtbf-have-you-already-heard-of-that-hard-drive-failure/
image: /images/Time_between_failures.jpg
thumbnailImage: /thumbnails/Time_between_failures.jpg
thumbnailImagePosition: left
categories:
  - Hi-Tech
tags:
  - Hi-Tech

---
![Time_between_failures](/images/Time_between_failures.jpg)
I've friends that recently encountered a big outage outage on a MySQL database on the top of a ZFS zpool. As this story is not common, I wanted to share it with you.

The error on MySQL was a table corruption error. MySQL was in maintenance mode and starting in normal mode wasn't possible because of that. MySQL wasn't able to recover it itself. After a few investigation, errors on the zpool shown data's corruption. After longer investigation nothing was found and the last thing to do was to contact Oracle Support. And the answer was amazing !

[MTBF : Mean Time Between Failure][1] ! This is the predicted elapsed time between inherent failures of a system during operation. And after verification, those hard drive had more then 5 years old, running 7d/24h and reached their MTBF (given by the hard drive constructor). During several ours it wasn't possible to do any kind of things on that file without having I/O errors. And suddenly this MTBF ended and the table file was reachable but corrupted. 

One of my friend says that MTBF means in fact (in French) : Mange Ta Bite Frère (translation : Eat your dick brother) as you can't do anything else during that time. I've never heard of that before and I will now look at it more often. 

I hope I've share something interesting with you. The conclusion is : check if you have disks older than 3 years to look at their MTBF

 [1]: https://www.google.com/url?q=http://en.m.wikipedia.org/wiki/Mean_time_between_failures&sa=U&ei=8nSeUbGSDZKzhAeE7oG4Dw&ved=0CA4QFjAB&usg=AFQjCNFU6P2J3bICZIWCw1CSIIV3pPDgmg