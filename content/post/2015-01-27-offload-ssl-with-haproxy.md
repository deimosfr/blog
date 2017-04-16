---
title: Offload SSL with HAProxy
author: Deimos
type: post
date: 2015-01-27T11:00:18+00:00
url: /2015/01/27/offload-ssl-with-haproxy/
image: /images/logo_haproxy.png
thumbnailImage: /thumbnails/logo_haproxy.png
thumbnailImagePosition: left
categories:
  - Cloud
  - Debian
  - HA
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Cloud
  - Debian
  - HA
  - Hi-Tech
  - Linux
  - Red Hat

---
![Haproxy-logo](/images/logo_haproxy.png)
A few months ago, I already talked about [offloading SSL with Nginx](https://blog.deimos.fr/2014/01/23/offloading-ssl-with-nginx-and-varnish/). I also wanted to try it with HAProxy which can be more interesting in some cases.

# The good

On HAProxy, the good thing is the simplicity to do it. First of all you need to have at least the version 1.5 of HAProxy so to get SSL support. Then you only need those lines to offload SSL:

{{< highlight bash >}}
frontend frontend-https
    bind :443 ssl crt /etc/haproxy/ssl/server-unified.pem
    reqadd X-Forwarded-Proto:\ https
    default_backend ssl-backend
{{< /highlight >}}

This is simple, powerful and works quickly.

The other good point is you don't have to update all your vhosts for it on the web server side. You can only run on the 80 port and HAProxy will automatically redirect to the web server.
  
Theses are the good points.

# The bad

The bad ones are :

  * The server-unified.pem file needs to include all the certificates (ca, crt...). So if you have multiple domains with multiple certificates, you have to concatenate them all in one file. This could quickly be a nightmare to manage when you have one of those which is going to expire (or you need to script the generation of the server-unified on each update).
  * If you don't want to concatenate, you can define a directory and put all of them inside. But this is not a good solution if you have a lot of certs to manage.
  * The flexibility. Of course, the main role of HAProxy is to load balance properly. So if you're expecting as flexibility as Nginx, simply forget about it. On the Layer 7, HAProxy adds some great features, but not as many as Nginx. So depending on what is you goal, it may not fit your requirements on that part.

A bad situation would be with URL specifics that need to be passed to the web server and then looping to the HAProxy, etc... That's why you need to consider where the intelligence should be placed (on top on HAProxy or on top on Nginx).

# Conclusion

Nginx and HAProxy are both able to offload SSL. HAProxy setup is lighter than Nginx which permit a faster setup but with less features. Both have their pros and cons, I do not recommend one especially because they both do correctly the job. But you need to think about the complexity of what you are requesting to them.

For example, if you have multiple vhosts to handle, the a good way to address it, would be to have a dedicated HAProxy instance for each domain (things that can be done in Cloud environment with load balancer as a service like on OpenStack). It will be easier to manage and with less risks in problem case.

To finish, [I made a documentation on how to setup the SSL offload on HAProxy][1]. Hope it will help.

 [1]: https://wiki.deimos.fr/HAProxy:_load_balance_your_traffic#Offloading_SSL