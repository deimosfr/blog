---
title: Ditaa pas un truc pour convertir mes schemas ASCII ?
author: Deimos
type: post
date: 2010-06-05T20:37:35+00:00
url: /2010/06/05/ditaa-pas-un-truc-pour-convertir-mes-schemas-ascii/
categories:
  - Hi-Tech
tags:
  - Hi-Tech

---

Suite à un [précédent post][1], c’est super de faire des schéma en ASCII, mais des fois on aimerait bien les avoir en version un peu plus propre. On va donc éviter de tout refaire hein :-) ! Et c’est là que Ditaa entre en jeu ! Il est écrit en java et permet simplement une conversion. Voici l’exemple d’un schéma ASCII :

{{< highlight bash >}}
+------+
 +-------+    +-----------+      +---------+  br0   |VE101 |
 |       |    |  OpenBSD  |----->| Debian  |------->|      |
 | WAN   |--->|  Router   |      | OpenVZ  |        +------+
 |       |    |  Firewall |----->| br0 br1 |  br1   +------+
 +-------+    +-----------+      +---------+------->|VE102 |
                                     |br0           |      |
                                     |VLAN br0.110  +------+
                                     v
                                 +---------+
                                 |VE103.110|
                                 +---------+
{{< /highlight >}}

On utilise donc Ditaa pour la conversion :

{{< highlight bash >}}
java -jar ditaa0_9.jar source destination
{{< /highlight >}}

Et voilà le résultat :
![schema](/images/schema.png)

Pas mal hein !

 [1]: https://blog.deimos.fr/2010/05/15/creer-des-diagrammes-en-ascii/
 [2]: http://ditaa.sourceforge.net/
