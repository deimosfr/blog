---
title: 'Cyanogen: upgrade your Samsung S2 to Kitkat'
author: Deimos
type: post
date: 2014-04-17T10:00:24+00:00
url: /2014/04/17/cyanogen-upgrade-your-samsung-s2-to-kitkat/
categories:
  - Android
  - Hi-Tech
tags:
  - Android
  - Hi-Tech

---

I wanted to upgrade my Android version from Cyanogen 10 to 11M5 on my old Samsung Galaxy S2. I though it would be an easy task, but not at all.

First of all, I had to be in recovery mod (bottom button + vol up + power). Then I wanted to create a /sdcard but it didn't want to mount and I didn't want to format my sdcard. So I mounted a tmpfs onto it:

{{< highlight bash >}}&gt; adb shell mount -t tmpfs none /sdcard{{< /highlight >}}

Then the problem was to find a compatible version of clockworkmod. Because of this issue when I wanted to apply Cyanogen:

{{< highlight bash >}}set_metadata_recursive: some changes failed{{< /highlight >}}

I had to find and send a compatible clockworkmod with kitkat ([link1](http://downloadandroidrom.com/file/GalaxyS2/recovery/CWM-KitKatCompatible-i9100.zip), [link2](https://mega.co.nz/#!65xDnDoA!IG9CfqrrirRNJJs-h7rjKVgB2SQQKOKnxBs14u3OB5U)) to the phone:

{{< highlight bash >}}&gt; adb push recovery-clockwork-4.0.1.5-galaxys2.zip /sdcard/
3388 KB/s (1358054 bytes in 0.391s){{< /highlight >}}

Afterward, apply the zip from the recovery mode from the phone. Then I had to download the M5 version on [Cyanogen website](http://download.cyanogenmod.org/?device=i9100) and push it on the device:

{{< highlight bash >}}&gt; adb push cm-11-20140405-SNAPSHOT-M5-i9100.zip /storage/sdcard0/
error: insufficient permissions for device{{< /highlight >}}

Bad isn't it ? When I looked at the connected devices, I got:

{{< highlight bash >}}&gt; adb devices
List of devices attached
???????????? no permissions{{< /highlight >}}

The solution was to restart the server and relaunch it:

{{< highlight bash >}}&gt; adb kill-server{{< /highlight >}}

Better now:

{{< highlight bash >}}&gt; adb devices
List of devices attached
0019026e78c75e recovery{{< /highlight >}}

Finally I could push last cyanogen version :

{{< highlight bash >}}adb push cm-11-20140405-SNAPSHOT-M5-i9100.zip /storage/sdcard0/
3259 KB/s (199874044 bytes in 59.887s){{< /highlight >}}

And installed the zip with the method I previously did for clockworkmod !
