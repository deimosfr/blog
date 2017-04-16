---
title: Reporting Nagios par mail
author: Deimos
type: post
date: 2012-10-08T10:00:47+00:00
url: /2012/10/08/reporting-nagios-par-mail/
image: /images/logo_nagios.png
thumbnailImage: /thumbnails/logo_nagios.png
thumbnailImagePosition: left
categories:
  - Hi-Tech
  - Nagios
tags:
  - Hi-Tech
  - Nagios

---
![Nagios_logo](/images/logo_nagios.png)
J'ai longtemps utilisé cet outil trouvé sur le net, puis repris conjointement avec un ex collègue qui permet de recevoir un email en fonction d'alertes de Nagios. Nous l'utilisions pour recevoir, avant d'arriver au taf ces emails, pour savoir quels sont les problèmes avant d'arriver. Cela permet d'arriver soit en courant, soit serein :-)

C'est un script qui va parser l'interface web graphique de Nagios, récupérer le minimum d'informations pour un bon affichage sur smartphone et envoyer un mail. Il suffit de mettre ceci en crontab pour recevoir ça le matin ou quant vous le souhaitez.

Pour en savoir plus, [suivez le lien][1].

 [1]: http://wiki.deimos.fr/Emails_récapitulatif_des_alertes_Nagios_en_cours