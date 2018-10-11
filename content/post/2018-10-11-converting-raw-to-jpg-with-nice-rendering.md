---
author: Deimos
type: post
url: /2018/10/11/converting-raw-to-jpg-with-nice-rendering/
categories:
  - photo
  - linux
date: 2018-10-11T00:00:00+02:00
tags:
  - photo
  - linux
image: /images/logo-darktable.png
thumbnailImage: /thumbnails/logo-darktable.png
thumbnailImagePosition: left
title: Converting RAW to JPG with nice rendering
url: /2018/10/11/converting-raw-to-jpg-with-nice-rendering/

---

![milkyway](/images/photo_milkyway.jpg)

I'm an amateur photographer and I'm using an [Olympus E-M1 Mark II][1] camera. I take photos in RAW mode to be able. For those who know me, my computer is running on Linux and I'm using [Geeqie][2] to display RAW picture. It's a very fast and powerful solution to display them.

In addition of displaying them quickly, it enhances the look and I really appreciate the rendering. Here is the original image (the first one) and the redered one by [Geeqie][2] (the second one):

![milkyway](/images/photo_barbecue.jpg)
![milkyway](/images/photo_barbecue_enhanced.jpg)

My objective was to reproduce it on [Darktable][3] and [Lightroom][4] without success. It's really hard to do. I've made search on the web to find a solution and finaly ask help on the [GitHub project][5]. And finally I got an answer to easily convert RAW to JPG with the same enhancement than Geeqie does ! Here is the command line I'm using:

{{< highlight bash>}}
find . -name "*.ORF" | parallel -j $(grep -c processor /proc/cpuinfo) --will-cite \
'echo {} ; exiftool -b -PreviewImage -w .jpg {} 1>/dev/null ; exiftool -tagsfromfile {} -all:all -overwrite_original {.}.jpg 1>/dev/null'
{{< /highlight >}}

This command will search at all ORF (Olympus RAW files) in the current directory, then use exiftool to export the embedded JPEG inside the RAW file and apply the rendering.

Hope you'll enjoy it like me.

 [1]: https://www.olympus.co.uk/site/en/c/cameras/om_d_system_cameras/om_d/e_m1_mark_ii/index.html
 [2]: http://www.geeqie.org/
 [3]: https://www.darktable.org/
 [4]: https://www.adobe.com/products/photoshop-lightroom.html
 [5]: https://github.com/BestImageViewer/geeqie/issues/635
