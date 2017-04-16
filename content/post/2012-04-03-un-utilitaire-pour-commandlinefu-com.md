---
title: Un utilitaire pour commandlinefu.com
author: Deimos
type: post
date: 2012-04-03T11:00:48+00:00
url: /2012/04/03/un-utilitaire-pour-commandlinefu-com/
categories:
  - FreeBSD
  - Hi-Tech
  - Linux
  - Mac
  - Nagios
  - OpenBSD
  - Puppet
  - Solaris
  - Web
tags:
  - FreeBSD
  - Hi-Tech
  - Linux
  - Mac
  - Nagios
  - OpenBSD
  - Puppet
  - Solaris
  - Web

---

Sachez que vous pouvez faire une recherche dans ce site pour en extraire des exemples grâce à un petit script. Exemple :
{{< highlight bash >}}
> fu -a awk
 1	#  List of commands you use most often
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head</p>
 2	#  Display a block of text with AWK
	awk '/start_pattern/,/stop_pattern/' file.txt</p>
 3	#  Remove duplicate entries in a file without sorting.
	awk '!x[$0]++' <file>
{{< /highlight >}} 
  
Et là vous vous dites que c'est super pratique :-). [Voici comment l'installer](http://wiki.deimos.fr/Fu_:_un_script_pour_récupérer_des_exemples_depuis_commandlinefu.com).

 [1]: http://www.commandlinefu.com
