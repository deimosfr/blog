---
author: Deimos
type: post
url: /2020/06/08/run-mac-os-on-linux/
categories:
  - linux
  - macos
  - kvm
  - virtualbox
  - virtualisation
date: 2020-06-08T00:00:00+02:00
tags:
  - linux
  - macos
  - kvm
  - virtualbox
  - virtualisation
image: /images/logo_macos.png
thumbnailImage: /thumbnails/logo_macos.png
thumbnailImagePosition: left
title: Easily run Mac OS on Linux
url: /2020/06/08/run-mac-os-on-linux/

---

![Name_logo](/images/macos_catalina.png)

Sometimes, you need to have a separate OS from your running one for testing purposes. Running Linux or Windows is straightforward in nowadays using Virtualization. However, running Mac OS is still a nightmare.

This is why I've searched and found 2 exciting projects that I wanted to share. The first one is based on VirtualBox, while the second one on KVM.

The funniest part is that both solutions are simply shell scripts :). But **they both make you win a lot of time!!!**

# On VirtualBox: macos-virtualbox

You can find [macos-virtualbox][2] on GitHub. You need to have [Virtualbox][1] installed first.

Then, simply clone it and follow instruction:

```bash
git clone https://github.com/myspaghetti/macos-virtualbox.git
cd macos-virtualbox
./macos-guest-virtualbox.sh

...

vm_name="macOS"
macOS_release_name="Catalina"    # install "HighSierra" "Mojave" or "Catalina"
storage_size=80000               # VM disk image size in MB. minimum 22000
storage_format="vdi"             # VM disk image file format, "vdi" or "vmdk"
cpu_count=2                      # VM CPU cores, minimum 2
memory_size=4096                 # VM RAM in MB, minimum 2048
gpu_vram=128                     # VM video RAM in MB, minimum 34, maximum 128
resolution="1280x800"            # VM display resolution
```

Easy right?!

# On KVM: macOS-Simple-KVM

This solution [macOS-Simple-KVM][3] requires more effort to make it work but brings better performances. You have to get (as described on the GitHub project) KVM, Qemu, and some libs to make it work.

Then, you have to clone it and follow the instructions.

# Conclusion

You've there two solutions easy to setup. Based on your needs (testing/performance), you can pick up the version you prefer.

 [1]: https://www.virtualbox.org/
 [2]: https://github.com/myspaghetti/macos-virtualbox
 [3]: https://github.com/foxlet/macOS-Simple-KVM
