---
author: Deimos
type: post
url: /2018/11/20/wireguard-on-debian-and-edgerouter/
categories:
  - linux
  - debian
  - edgerouter
  - ubiquiti
  - vpn
  - network
  - wireguard
date: 2018-11-20T00:00:00+02:00
tags:
  - linux
  - debian
  - edgerouter
  - ubiquiti
  - vpn
  - network
  - wireguard
image: /images/logo_wireguard.png
thumbnailImage: /thumbnails/logo_wireguard.png
thumbnailImagePosition: left
title: WireGuard on Debian and EdgeRouter
url: /2018/11/20/wireguard-on-debian-and-edgerouter/

---

![WireGuard](/images/wireguard.png)

[WireGuard][1] is a very good alternative to [OpenVPN][2]. I've been [using OpenVPN][3] for more than 10 years now and I was happy until I understood how slow it can be on low energy devices like EdgeRouter.

To give you an idea, on my Fiber Home connection (200Mbps), I'm limited to 18Mbps. **With OpenVPN, I'm reaching the maximum CPU usage on the EdgeRouter**. I've heard of WireGuard about a year now and it was time for me to test this interresting alternative.

To give you more context, I want to connect in client/server mode 2 servers and a laptop (server(1) <-> server(2) and server(1) <-> laptop(3)). One server is a [EdgeRouter][4] and the other one a physical Debian 9 server hosted in a datacenter.

First of all, before going ahead on how to do it, let's look at the benchmark tests I've made with [iperf][5] in the configuration with 2 servers between the EdgeRouter and a Debian server (using wan connection). With WireGuard:

```bash
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
[  4] local 192.168.0.2 port 5001 connected with 192.168.0.1 port 46074
[ ID] Interval       Transfer     Bandwidth
[  4]  0.0-10.1 sec  90.0 MBytes  74.9 Mbits/sec
```

With OpenVPN:

```bash
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
[  5] local 192.168.0.2 port 5001 connected with 192.168.0.1 port 21656
[ ID] Interval       Transfer     Bandwidth
[  5]  0.0-10.4 sec  22.4 MBytes  18.1 Mbits/sec
```

Around **4x faster** !!! Now it's time to setup WireGuard :)

## On EdgeRouter

At the moment I'm writing those lines, Ubiquiti doesn't make too much efforts on updating Debian on the EdgeMax (long old years threads exist on the forum requesting it). To install Wireguard, we need a specific compiled version depending on the model of router you have. Choose the version you need on the [GitHub project][6]. Then install it, you can use this script to facilitate it:

```bash
#!/bin/bash

version=0.0.20181007
deb="wireguard-e100-${version}-1.deb"

apt-get update

cd /tmp
curl -L -O https://github.com/Lochnair/vyatta-wireguard/releases/download/${version}-1/$deb
dpkg -i $deb && rm -f $deb
```

We also need to create the public and private key to authenticate servers/clients between each others. Connect through SSH as root on the EdgeRouter and run the following commands:

```bash
mkdir /config/wireguard
cd /config/wireguard
wg genkey | tee wg-private.key | wg pubkey > wg-public.key
chmod 600 wg*
chmod 700 .
```

Now you can configure via [Vyatta][8] your EdgeRouter (not as root):

```bash
$ configure

set interfaces wireguard wg0 private-key /config/wireguard/wg-private.key
set interfaces wireguard wg0 address 192.168.0.1/24
set interfaces wireguard wg0 listen-port 51820

# You will be able configure this line once you'll generate the public key of the other server
set interfaces wireguard wg0 peer GIPWDet2eswjz1JphYFb51sh6I+CwvzOoVyD7z7kZVc= allowed-ips 192.168.0.0/24

commit
save
```

You now have to **open the port from the outside and enable NAT/masquerade on the wg0** interface.

## On Debian

WireGuard is not integrated yet in Debian stable (currently version 9), that's why we'll need to add the unstable Debian repository and pin it.

```bash
echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable
apt update
apt install wireguard
```

Now that it's installed, we can generate the keys and configure it as well:

```bash
$ cd /etc/wireguard
$ wg genkey | tee wg-private.key | wg pubkey > wg-public.key
$ chmod 600 *.key
$ cat /etc/wireguard/wg0.conf
[Interface]
Address = 192.168.0.2/24
PrivateKey = 0Ithe74Dvi0Vt30o2qhKigb1EyLvVoXA2wchGZcS5mg=

# Peer information of the EdgeRouter
[Peer]
PublicKey = iXSujaz+dzKkpNMhwdUsxV2+351pvX5hw4Wr6Qx9Egs=
AllowedIPs = 192.168.0.0/24
Endpoint = edgemax-fqdn:51820
PersistentKeepalive = 25
```

You can make a try to validate it:

```bash
wg-quick up wg0
ping -c 3 192.168.0.1
wg-quick down wg0
```

You can also validate on both side the configuration with wg command. You should see the appropriate config like this:

```bash
interface: wg0
  public key: GIPWDet2eswjz1JphYFb51sh6I+CwvzOoVyD7z7kZVc=
  private key: (hidden)
  listening port: 52569

peer: iXSujaz+dzKkpNMhwdUsxV2+351pvX5hw4Wr6Qx9Egs=
  endpoint: edgemax-fqdn:51820
  allowed ips: 192.168.0.0/24
  persistent keepalive: every 25 seconds
```

You can enable it as a systemd service this way:
```bash
systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service
```

You can add as many peers as you want on the EdgeRouter from Vyatta command line.
Here is another [useful link][7] for Arch users.

### With Network Manager

It's so easy to import a configuration in Network Manager:

```bash
nmcli connection import type wireguard file "wg0.conf"
```

Hope you enjoyed reading

 [1]: https://www.wireguard.com/
 [2]: https://openvpn.net/
 [3]: https://wiki.deimos.fr/OpenVPN_:_Mise_en_place_d'OpenVPN_sur_diff%C3%A9rentes_plateformes
 [4]: https://www.ubnt.com/edgemax/edgerouter-poe/
 [5]: https://iperf.fr
 [6]: https://github.com/Lochnair/vyatta-wireguard
 [7]: https://wiki.archlinux.org/index.php/WireGuard
 [8]: https://vyos.io/
