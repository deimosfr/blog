---
author: Deimos
type: post
url: /2022/06/27/my-jeedom-setup/
categories:
  - linux
date: 2022-06-27T00:00:00+02:00
tags:
  - linux
image: /images/logo_jeedom.png
thumbnailImage: /thumbnails/logo_jeedom.png
thumbnailImagePosition: left
title: My Jeedom setup
url: /2022/06/27/my-jeedom-setup/

---

![Name_logo](/images/logo_jeedom.png)

I'm using Jeedom for several years now. Using it with official box, Raspberry, Synology... I wanted to write down some notes, especially things I've done in order to find them if one day I needed them.

Here are additional stuffs I'm using:
* A GSM USB key (Huawei E3372)
* An Elero USB key (Elero Transmitter Stick)
* A Z-Wave key (Aeotec Z-Stick Gen5)

# Installation

After Jeedom install, here are the Debian packages I needed:

```bash
apt-get update
apt-get install usbutils certbot python3-certbot-dns-cloudflare etckeeper usb-modeswitch libusb-dev
```

# TLS with Let's encrypt

I'm using Let's encrypt to get a valid TLS. I'm using Cloudflare for a DNS challenge, so we need to enable ssl on Apache:

```bash
a2enmod ssl
a2ensite default-ssl
```

Add your cloudflare config in `/etc/letsencrypt.cloudflare`:
```
dns_cloudflare_email = xxx
dns_cloudflare_api_key = xxx
```

Generate the certificate:
```
certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt.cloudflare -d example.com
```

Then edit `/etc/apache2/sites-available/default-ssl.conf` and update those lines to target your let's encyrpt certs:

```
SSLCertificateFile	/etc/letsencrypt/live/<xxx.yourdomain.here>/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/<xxx.yourdomain.here>/privkey.pem
```

Reload apache2 config:
```
systemctl reload apache2
```

Add this as a crontab to auo-renew cert:

```
*/6 * * * * /usr/bin/certbot renew --quiet --post-hook "systemctl restart apache2" > /dev/null 2>&1
```

# GSM

Here is my key:

```
$ lsusb
Bus 001 Device 005: ID 12d1:155e Huawei Technologies Co., Ltd.
```

I had to create this file `/etc/usb_modeswitch.d/12d1:1f01` with this content:
```
TargetVendor=0x12d1
TargetProduct=0x1f01
MessageContent="55534243000000000000000000000011060000000000000000000000000000"
NoDriverLoading=1

```

Then to get my GSM tty in `/etc/udev/rules.d/99-usb-serial.rules`:
```
SUBSYSTEM=="tty", ATTRS{idVendor}=="12d1", ATTRS{idProduct}=="1f01", SYMLINK+="ttyGSM"
```

# Conclusion

That's it :)
