---
title: Ubuntu 12.10 et Wifi Ralink rt3290
author: Deimos
type: post
date: 2012-11-17T11:00:24+00:00
url: /2012/11/17/ubuntu-12-11-wifi-ralink-rt-3290/
image: /images/logo_ubuntu.png
thumbnailImage: /thumbnails/logo_ubuntu.png
thumbnailImagePosition: left
categories:
  - Others
tags:
  - Others

---
![ubuntu_logo](/images/logo_ubuntu.png)
J'ai eu pour mon anniversaire un Netbook HP. Magnifique petite bête. Seul inconvénient temporaire, le matériel est trop récent et certains pilotes ne fonctionnent pas comme le wifi par exemple. En cherchant un peu sur le net, j'ai trouvé des solutions pour faire fonctionner les pilotes sur Ubuntu 12.04. Le problème est que lorsque je compilais les drivers sur une 12.10, j'avais des kernel panic à répétition.

Sur launchpad, j'ai vu que le driver rt3290 était intégré dans le kernel 3.6 et manque de bol, sur Ubuntu 12.10 c'est un kernel 3.5 qui est installé. Je me suis donc recompiler un kernel 3.7 et l'ai installé. Une fois redémarré, le système reconnaissait bien le wifi, mais le Network Manager me disait "micrologiciel absent". Je suis tombé sur [ce post](http://forum.novatech.co.uk/showthread.php?25562-How-to-get-the-RAlink-3290-wireless-working) qui m'a permit de résoudre ce problème et faire finalement fonctionner le wifi. J'avais tout simplement oublié de copier le firmware.

Donc pour ceux qui souhaitent faire fonctionner cet équipement :

{{< highlight bash >}}
$ lspci | grep Network
02:00.0 Network controller: Ralink corp. Device 3290
{{< /highlight >}}

Je vais donner tout ce qu'il faut. Pour commencer, récupérez le kernel que j'ai recompilé, ainsi que le firmware associé :

* Kernel 3.7.10 : Kernel 3.7.10.
* Firmware : [http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/rt3290.bin](http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/rt3290.bin)

Vous avez donc 2 fichiers. Nous allons installer le kernel :

{{< highlight bash >}}
sudo dpkg -i linux-image-3.7.6_1.0_amd64.deb
{{< /highlight >}}

Puis il faut mettre le firmware dans le dossier des firmwares :

{{< highlight bash >}}
sudo cp rt3290.bin /lib/firmware
{{< /highlight >}}

Il ne vous reste plus qu'à redémarrer pour que cela fonctionne :-). Une dernière petite chose : j'ai noté qu'avec les redémarrages, le wifi ne restait pas et je n'ai pas vraiment le temps de regarder pourquoi. Donc arrêtez votre ordinateur et rallumez le si besoin pour que le wifi reste fonctionnel.

Pour ceux qui se demandent pourquoi je n'ai pas mis ça sur le wiki, la réponse est simple : Pour moi ce type de doc est volatile. Dans quelques mois elle sera obsolète. Je n'ai tout simplement pas envie d'avoir ce genre de chose sur le wiki.

Note : le temps que ce post paraisse des contournements similaires aux miens ont vu le jour sur Launchpad.

Update 1 : le kernel n'est malheureusement plus disponible sur le site de free. Je réupload une version plus récente du kernel (3.7.10) pour Debian qui <del>devrait fonctionner</del> fonctionne également sur Ubuntu et disponible ici.
  
Update 2 : [voici la version 3.9.6 du kernel][1]

 [1]: http://dl.free.fr/c7wXeJ12M "Kernel 3.9.6"
