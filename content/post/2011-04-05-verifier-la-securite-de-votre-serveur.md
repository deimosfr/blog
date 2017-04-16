---
title: Vérifier la sécurité de votre serveur
author: Deimos
type: post
date: 2011-04-05T21:12:17+00:00
url: /2011/04/05/verifier-la-securite-de-votre-serveur/
image: /images/alienlogo_vectorized.png  
thumbnailImage: /thumbnails/alienlogo_vectorized.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Security
  - Web
tags:
  - Hi-Tech
  - Security
  - Web

---
![alienlogo_vectorized](/images/alienlogo_vectorized.png)  
Je ne le répèterais jamais assez, vérifiez votre installation et configuration et testez là ensuite !

Je suis confronté actuellement à un serveur qui passe son temps à se faire hacker. J'ai du auditer la sécurité de celui ci et je me rends compte que beaucoup de personne néglige les aspects de la sécurité. Pourquoi tant d'acharnement ? Faut dire aussi :
  
* Pas de Firewall
  
* Pas de modules de sécurité
  
* Pas d'anti bruteforce
  
* Trop de ports inutiles ouvert
  
* ...
  
Bref, ça fait un peu beaucoup. Si vous avez besoin de faire un petit audit de sécurité de votre site automatiquement (c'est pas suffisant, mais c'est un bon début), je vous rappelle qu'il existe [Nikto][1]. Je vous ai fait une petite [documentation sur Nikto][2].

 [1]: http://cirt.net/nikto2
 [2]: http://wiki.deimos.fr/V%C3%A9rifier_la_s%C3%A9curit%C3%A9_de_son_site_web_avec_Nikto