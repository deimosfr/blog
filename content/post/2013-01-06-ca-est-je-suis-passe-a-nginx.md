---
title: Ca y est, je suis passé à Nginx
author: Deimos
type: post
date: 2013-01-06T11:00:43+00:00
url: /2013/01/06/ca-est-je-suis-passe-a-nginx/
image: /images/logo_ngnix.png
thumbnailImage: /thumbnails/logo_ngnix.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Web
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Web

---
![Nginx-logo](/images/logo_ngnix.png)
Fini le duo [Apache][1]/[Varnish][2] performant mais gourmand en ressources. Pour de gros sites, c'est certains que ce couple est très utile, mais pour mon blog, mon wiki et mes autre babioles, pas forcément !

Alors voilà, je suis passé à Nginx et après plusieurs jours dessus, je suis globalement satisfait. Petit bémol pour le stockage des éléments statiques qui n'est visiblement pas faisable sans passer par du proxy_pass. J'ai pu observer une gestion du cache globale moins efficace avec Nginx qu'avec Varnish. En même temps c'est pas son but principale, alors je ne crache pas dans la soupe.

A part ça, la configuration c'est du caviar, c'est clair et assez modulaire, bref j'adore. Puissant, facile et rapide a mettre en place, je comprends pourquoi il monte aussi vite en popularité.

J'ai mis à jour [la documentation sur Nginx][3] qui je l'espère vous aidera vous aussi a switcher.

 [1]: http://wiki.deimos.fr/Installation_et_configuration_d%27Apache_2
 [2]: http://wiki.deimos.fr/Varnish_:_un_accélérateur_de_site_web
 [3]: http://wiki.deimos.fr/Nginx_:_Installation_et_configuration_d'une_alternative_d'Apache "Nginx"