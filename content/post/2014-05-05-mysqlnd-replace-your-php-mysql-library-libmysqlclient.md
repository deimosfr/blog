---
title: 'Mysqlnd: replace your old php mysql client library by mysqlnd'
author: Deimos
type: post
date: 2014-05-05T10:00:52+00:00
url: /2014/05/05/mysqlnd-replace-your-php-mysql-library-libmysqlclient/
image: /images/logo_php.png
thumbnailImage: /thumbnails/logo_php.png
thumbnailImagePosition: left
categories:
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - SQL
tags:
  - Databases
  - Debian
  - Hi-Tech
  - Linux
  - SQL

---
![php_logo](/images/logo_php.png)
As you may know, I'm using and loving MariaDB. A colleague recently introduced me the benefits of the php built-in MySQL/MariaDB library (shame on me, I never heard of it). Here are the informations you can find from it on the MySQL website:

> The mysqlnd library is highly optimized for and tightly integrated into PHP. The MySQL Client Library cannot offer the same optimizations because it is a general-purpose client library.
> 
> The mysqlnd library is using PHP internal C infrastructure for seamless integration into PHP. In addition, it is using PHP memory management, PHP Streams (I/O abstraction) and PHP string handling routines. The use of PHP memory management by mysqlnd allows, for example, memory savings by using read-only variables (copy on write) and makes mysqlnd apply to PHP memory limits. Additional advantages include:
> 
>   * Powerful plugin API to extend feature set
>   * Asynchronous, non-blocking queries
>   * 150+ performance statistics
>   * Ships together with the PHP 5.3, and later, source
>   * No need to install MySQL Client Library
>   * Powerful plugins.

Why did I really changed? Because I was facing to this warning problems after [an upgrade of PHP library from DotDeb packages](http://www.dotdeb.org/2014/04/04/about-the-mysql_connect-headers-and-client-library-minor-version-mismatch-warning-2/):

{{< highlight bash >}}PHP Warning: mysql_connect(): Headers and client library minor version mismatch. Headers:50535 Library:50617{{< /highlight >}}

So I decided to switch to php5-mysqlnd as a replacement of php5-mysql on Wheezy. However, it is not as easy as it could be. **You need to completely remove php5-mysql, loose dependencies and then reinstall everything.** To be more clear:

{{< highlight bash >}}apt-get remove php5-mysql
apt-get install php5-mysqlnd
apt-get install php-fpm php5-geoip...{{< /highlight >}}

Now everything is back to normal and I won't be annoyed of it in the future. You can also see the differences on [the official PHP website](http://www.php.net/manual/en/mysqlinfo.library.choosing.php).
