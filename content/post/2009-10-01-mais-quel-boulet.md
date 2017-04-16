---
title: Mais quel boulet !
author: Deimos
type: post
date: 2009-10-01T10:01:38+00:00
url: /2009/10/01/mais-quel-boulet/
categories:
  - Hi-Tech
  - Solaris
tags:
  - Hi-Tech
  - Solaris

---

Et bah voilà ! Un rm sur le / et sur une machine de prod. Heureusement, pas en vraiment en prod, mais pré prod ouf. J’étais sur que ça allait m’arriver un jour ! Ca fait 2 fois ! La dernière fois c’était ya ptete 5 ans chez moi. Tout ça parceque le shell il dit pas ou t’es, que ya pas de rm -i. Enfin bref, va falloir faire un shell de prod c’est sur !

Pour ceux qui veulent se foutre de ma gueule :

{{< highlight bash >}}
bash-3.00# ls /opt/SUNWexplo/output
explorer.10865c2d.PA-TLH-SRV-PRD-2-2009.10.01.08.55         explorer.10865c2d.PA-TLH-SRV-PRD-2-2009.10.01.08.55.tar.gz
bash-3.00# rm -Rf *
^C
bash-3.00# ls
dev         Documents   export      kernel      lost+found  net         platform    sbin        tmp         var
devices     etc         global      lib         mnt         opt         proc        system      usr         vol`
{{< /highlight >}}
