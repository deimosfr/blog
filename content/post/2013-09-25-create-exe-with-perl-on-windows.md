---
title: Create exe with Perl on Windows
author: Deimos
type: post
date: 2013-09-25T10:00:29+00:00
url: /2013/09/25/create-exe-with-perl-on-windows/
image: /images/Perl_icon.png
thumbnailImage: /thumbnails/Perl_icon.png
thumbnailImagePosition: left
categories:
  - Developement
  - Hi-Tech
  - Windows
tags:
  - Developement
  - Hi-Tech
  - Windows

---
![Perl_icon](/images/Perl_icon.png)
In the past, [I already made an article on how to make exe from a Perl script on Windows](http://wiki.deimos.fr/Introduction_%C3%A0_Perl#Cr.C3.A9ation_d.27un_exe_sous_Windows). I was **using Strawberry** or Activesync but have a preference for Strawberry as **it's totally free** :-).

This time, I tried to reproduce the tips but encountered several issues. The first one was that error :
  
{{< highlight bash >}}
The locale codeset (cp1252) isn't one that perl can decode, stopped at Encode/Locale.pm line 94.
{{< /highlight >}}

It could simply be **resolved by addressing '-x'** parameter to the 'pp' command line.

The other problem was this **compilation error** :

{{< highlight bash >}}
SYSTEM ERROR in executing url_service_action.pl: 256 at C:/strawberry/perl/site/lib/Module/ScanDeps.pm line 1302.
{{< /highlight >}}

To quickly fix that issue, I did a sad thing : commenting those lines in C:\strawberry\perl\site\lib\Module\ScanDeps.pm line 1302 :

{{< highlight perl >}}
#die $compile
# ? "SYSTEM ERROR in compiling $file: $rc"
# : "SYSTEM ERROR in executing $file: $rc"
# unless $rc == 0
{{< /highlight >}}

This is certainly not the best thing to do but it resolved my issue and my binary works perfectly :-)
