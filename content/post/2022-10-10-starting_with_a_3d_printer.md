---
author: Deimos
type: post
url: /2022/10/10/starting_with_a_3d_printer/
categories:
  - blender
  - 3d print
  - home assistant
date: 2022-10-10T00:00:00+02:00
tags:
  - blender
  - 3d print
  - home assistant
image: /images/logo_blender.png
thumbnailImage: /thumbnails/logo_blender.png
thumbnailImagePosition: left
title: Starting with a 3D Printer
url: /2022/10/10/starting_with_a_3d_printer/

---

![Name_logo](/images/logo_blender.png)

One week ago, I bought a 3D printer to print custom pieces for my house. It’s been a long time since I wanted to try it, and a friend finally convinced me.
I’m writing this post because it wasn’t that easy to start, this post contains notes for me, and I hope it will also help beginners.

So I chose the [Creality CR-10 Smart Pro](https://www.creality.com/products/creality-cr-10-smart-pro-3d-printer) for those reasons:
* Open source 3D printer with all replaceable pieces
* Creality is one of the market leaders for personal usage
* Direct drive by default to reduce printing issue
* Manual and automatic bed leveling
* Cloud-based app to remotely observe the printing
* Magnetic sheet by default

This model is not the cheapest, but it’s second-hand, and CR-10 models are easy to find at the correct price.

# Beginner advises

I spent some time trying to understand why I couldn’t print without failures. I had around 30 attempts before being able to make one working print.
Why? Because it’s an error to think it’s like a classical printer. It’s different, maybe less mature, and you must understand physics’ basics before moving forward.

I encountered several issues; some could have been handled better if I had better understood what I was doing. Lessons learned:
* Avoid bad filament quality.
* The first layer on the bed is essential and should be large enough to avoid failures.
* Support and Adhesion options are not useless, even for PLA (which does not suffer that much from warping).
* Unclean nozzle throat: had to manually clean and remove blocked filament (videos: [1](https://www.youtube.com/watch?v=YYHWrRWKkGI&t), [2](https://www.youtube.com/watch?v=AcCsFCJbmKo&t), [3](https://www.youtube.com/watch?v=z0eLN7Gj-YY&t)).
* Old firmware: firmware I had was buggy LCD touchscreen sensitivity, cloud connectivity didn’t work, and so on. Updating it resolved most issues, and I should have started with this directly.
* Z axe should be perfectly calibrated on the bed
* First layer speed should not exceed 30 mm/s (I personnaly uses 10mm/s to avoid issues)
* Disable fan for the first layer to maximize the grip
* Create a [temperature tower](https://teachingtechyt.github.io/calibration.html#temp) to better know your filament

One prevalent error everybody makes mistakes on is the **warping effect**. Here are helpful links to better understand the issue and how to solve it:
* [A complete explanation to avoid warping effect](https://www.youtube.com/watch?v=A8TQ4Itr-uk)
* [Other warping issues](https://www.simplify3d.com/support/print-quality-troubleshooting/warping/)
* [Sticking issue to the bed](https://www.simplify3d.com/support/print-quality-troubleshooting/not-sticking-to-the-bed/)

# 3D modeling software choice

Before discussing software, you may want to print existing models when you recently got a new printer. [Thingiverse](https://www.thingiverse.com/) is an amazing website with tons of modeled objects.

Now let’s talk about the tool you can use to create your 3D objects. I’ve tested some. I had a little experience more than 20 years ago on 3D, but I almost forgot everything.
So I dug into what exists and found exciting tools. Some are more or less complex. The complexity level and time you want to spend on it will define the tool you have to choose.

Here are some free interesting ones I've found and tested:
* [ThinkerCAD](https://www.tinkercad.com/): full web version, light, easy to start
* [FreeCAD](https://www.freecadweb.org/): more complete, good for modeling
* [Blender](https://www.blender.org/): very complete solution, excellent to make

My final choice was finally Blender. Not the simplest, but honestly, with the tutorial you can find on Youtube, with a maximum of two hours, you can easily manage all the bases to create many things.
Here is the useful tutorial I’ve found (in French):
* [Blender basics 1](https://www.youtube.com/watch?v=rsJLVflzZVw)
* [Blender basics 2](https://www.youtube.com/watch?v=qWknC446f2Q)
* [Blender basics 3](https://www.youtube.com/watch?v=YtEOBsCX8Qg)
* [Blender basics for 3D modeling](https://www.youtube.com/watch?v=6WMNq1sw6K0&t)
* [Build a drawer cabinet](https://www.youtube.com/watch?v=rReEsWLyBDc&t)
* [Create from scratch a technical piece](https://www.youtube.com/watch?v=d_F1DjB5SjA)
* [Modeling a vase](https://www.youtube.com/watch?v=a7AiZDEXSIs)
* [Make a hole](https://www.youtube.com/watch?v=nnspVLPCqpM)

# Slicer

iA 3D printing slicer prepares a 3D model for your 3D printer by generating G-code files. I only tested 1, as it’s the reference that everybody talks about. So I'm using [Ultimaker Cura][1].

It will allow you to set printing parameters to define the granularity of your prints, the speed, border size, preview print layers by layers etc.

I spent some time finding good parameters with an “Amazon Basics” PLA. Here are the ones that work for me (from the standard quality profile) for most printing models:
* Quality:
    * Initial Layer Height: 0.3 (lower will grow warping effect, **must not exceed 75% of nozzle diameter**)
* Material:
    * Printing temperature: 200
    * Build plate temperature: 60
    * Build plate temperature initial layer: 60 (lower sometimes produces warping)
* Speed:
    * Initial layer speed: 10 (lower the first layer speed will reduce printing failures)
    * Initial layer print speed: 10
* Cooling:
    * Regular fan speed at layer: 4 (minimize warping issue as well)

Do not hesitate to add the Adhesion or Support checkbox if you encounter stability issues during the printing.

# Printer software

Having [Cura][1] and your computer always up and running to print or transfer to the SD card of the printer objects is soooooo painful. It even doesn’t bring much value to the printing part.
This is why I’m using [Octoprint](https://octoprint.org/) on a connected Raspberry to the 3D printer. It gives you a web interface to perform many actions (print, calibrate, set heat temperature, send terminal gcode, connect a webcam, set timelapse, etc.).

A must have tool when you add some plugins like:
* **Jeedom**: connect to Jeedom (home automation) to switch on and off your printer
* **Creality cloud**: connect your raspberry to Creality cloud and monitor/control your printer remotely
* **Obico**: remote control your printer with failure detection!
* **Terminal Commands**: with [Marlin gcode](https://marlinfw.org/meta/gcode/), you can create custom buttons for custom functions

Many others are also helpful, and you can see the complete list [here](https://plugins.octoprint.org/).

I hope you enjoyed reading this post. Feel free to let a comment :)

 [1]: https://ultimaker.com/software/ultimaker-cura
