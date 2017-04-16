---
title: GlusterFS vs DRBD+OCFS2
author: Deimos
type: post
date: 2010-12-29T13:18:02+00:00
url: /2010/12/29/glusterfs-vs-drbdocfs2-2/
categories:
  - HA
  - Hi-Tech
tags:
  - HA
  - Hi-Tech

---

Ca fait un moment que je me dit qu’il va falloir étudier le cas de la réplication de fichiers temps réel entre mon serveur perso et ma dedibox. J’en avais un peu marre de mon rsync crontabé (oui le verbe existe).

J'ai donc écris une petite documentation sur [GlusterFS ](http://wiki.deimos.fr/GlusterFS_:_Filesystem_cluster_pour_HA)sur comment répliquer le /var/www. Dans la pratique c'est plutôt bien :
  
* Rapide à mettre en place
  
* Simple
  
* Extensible
  
Ouaaaa...séduisant tout ça hein ! Seul hic c'est que dans la vrai vie, c'est un cauchemars. En effet avec une liaison LAN, pas de problèmes, les accès sont performants, mais à travers du WAN, c'est tout simplement inutilisable (a moins d'une liaison fibre de malade). Les pages mettent 3 à 5 min pour s'afficher. Je me suis tourné du côté du tuning de GlusterFS? mais je n'ai rien trouvé de très satifaisant.

Je me suis donc attaqué à [DRBD][1] + [OCFS2][2], ce qui m'a donné l'occasion de mettre à jour mes docs. Et là, c'est le jour et la nuit, ça fonctionne parfaitement. Par contre :
  
* Long à mettre en place
  
* Meta données à gérer
  
* Pas très simple d'utilisation
  
* Uniquement 2 noeuds (DRBD en cause, mises à jour en attente pour + de noeuds)
  
* Nécessite un cluster pour la reprise automatique d'activité
  
Mon plus gros problèmes actuel (car pas eu le temps de finir l'étude) est le repassage automatique en primary d'un noeud DRBD après déconnexion. A première vue, la seule solution est de mettre un cluster de type PaceMaker pour palier à ce problème. Au final on se retrouve avec une belle usine à gaz par rapport au simple GlusterFS.

Clairement les avantages et inconvénients sont importants. Je pense que GlusterFS est très bien pour un partage Samba ou autre, mais que pour de l'accès de données un peu plus diversifiés tel que le PHP ou autres appli dépendantes de plusieurs fichiers, ce n'est pas la solution à utiliser aujourd'hui. DRBD et OCFS2 sont depuis pas mal d'années utilisés et donc très stable. Ils continuent tous les 2 à évoluer, mais un peu trop lentement à mon gout. D'autres filesystems de réplication (et + si affinité) commencent à pointer le bout de leur nez dont [Ceph][3] qui sera intégré dans le noyau 2.6.37. Malheureusement, ceci n'est pas encore dispo pour les environnements de productions.

Temporairement (le temps de finaliser mon étude) je suis repassé à ma bonne vielle méthode Rsync. Si vous avez des solutions ou propositions à m'apporter, n'hésitez pas :-)

 [1]: http://wiki.deimos.fr/Installation_et_configuration_de_DRBD
 [2]: http://wiki.deimos.fr/OCFS2_:_Le_FileSystem_Cluster_d%27Oracle
 [3]: http://ceph.newdream.net/
