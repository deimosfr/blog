---
author: Deimos
type: post
url: /2018/12/19/running-docker-for-your-home-server/
categories:
  - linux
  - docker
  - wordpress
  - traefik
  - docker-compose
date: 2018-12-19T00:00:00+02:00
tags:
  - linux
  - docker
  - wordpress
  - traefik
  - docker-compose
image: /images/logo_docker.png
thumbnailImage: /thumbnails/logo_docker.png
thumbnailImagePosition: left
title: Running Docker for your home server
url: /2018/12/19/running-docker-for-your-home-server/

---

![Docker](/images/logo_docker.png)

Since several years, I'm hosting a lot of things: blog, wiki, emails etc... I've played with [Vserver][1], [OpenVZ][2], [KVM][3] and finaly [LXC][4]. For years, I've learned how to use all of them but the most known solution during the last years is [Docker][5].

I even can remeber the first Meetup I've attended in Paris talking about Docker 5 years ago. Now containers are eveverywhere. I recently changed the server I'm running for my own usage and this was the good timing to switch from LXC to Docker.

I've wrote several blog posts regarding [Kubernetes][6] and my first thoughts were about using Kubernetes. But it looks like really overkill on a single machine. I then tought about using [Docker Compose][7] and I think this is the most appropriate solution for this use case.

# Install and configure Docker Compose

I'm running on a Debian server and have installed Docker from the [official repository][8].

Then to make it simple, I'm using systemd to automatically run my containers when the server boots up ```/etc/systemd/system/docker-compose@.service``` :

```bash
[Unit]
Description=%i service with docker compose
Requires=docker.service
After=docker.service

[Service]
Restart=always
# The directory where your compose config files are stored
WorkingDirectory=/etc/docker/compose/%i

# Remove old containers, images and volumes
ExecStartPre=/usr/bin/docker-compose down -v
ExecStartPre=/usr/bin/docker-compose rm -fv
ExecStartPre=-/bin/bash -c 'docker volume ls -qf "name=%i_" | xargs docker volume rm'
ExecStartPre=-/bin/bash -c 'docker network ls -qf "name=%i_" | xargs docker network rm'
ExecStartPre=-/bin/bash -c 'docker ps -aqf "name=%i_*" | xargs docker rm'

# Compose up
ExecStart=/usr/bin/docker-compose up

# Compose down, remove containers and volumes
ExecStop=/usr/bin/docker-compose down -v

[Install]
WantedBy=multi-user.target
```

You can add a Docker compose configuration file (docker-compose.yml) and start it:

```bash
systemctl enable docker-compose@myservice
systemctl start docker-compose@myservice
```

This makes container configuration very simple and easily manageable.

To finish, let's create a dedicated network for containers (here called frontend):

```bash
docker network create frontend
```

# Using Traefik as reverse proxy

To make containers accessible from the outside, with [Let's Encrypt][9] TLS and connected to Docker. For this I've setup [Traefik][10] with Docker compose.

I'm using this Docker compose configuration file ```/etc/docker/compose/traefik/docker-compose.yml```:

```yaml
version: '3'
services:
  traefik:
    image: traefik:1.7.6-alpine
    restart: always
    ports:
      - "80:80"
      - "443:443"
      # WebUI admin port
      - "8082:8080"
    # Need this network to make Traefik able to forward on all containers running on this one too
    networks:
      - frontend
    labels:
      traefik.enable: true
      traefik.domain: 'fqdn.com'
      traefik.tags: web,lb,traefik
      traefik.frontend.rule: 'Host:traefik.docker.local'
      traefik.docker.network: 'frontend'
    volumes:
      - ./conf/traefik:/etc/traefik
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      TZ: "Europe/Paris"
      # Cloudflare API credentials
      CF_API_EMAIL: my@email
      CF_API_KEY: mykey

networks:
  frontend:
    external: true
```

And the Traefik configuration ```/etc/docker/compose/traefik/conf/traefik/traefik.toml```:

```yaml
# Set default entrypoints
defaultEntryPoints = ["http", "https"]

checkNewVersion = true
MaxIdleConnsPerHost = 500
logLevel = "INFO"
sendAnonymousUsage = true

# Launch API
[api]

# Connect to Docker host to get the running docker instances
[docker]
  domain = "docker.local"
  watch = true
  exposedByDefault = false

# Additional static configuration file
[file]
  filename = "/etc/traefik/rules.toml"
  watch = true

# TLS Let's Encrypt configuration with Cloudflare support
[acme]
email = "my@email"
storage = "/etc/traefik/acme/acme.json"
entryPoint = "https"
OnHostRule = true
acmeLogging = true
  [acme.DNSChallenge]
  provider = "cloudflare"

# Request wildcard domain TLS
[[acme.domains]]
  main = "*.fqdn.com"

# Run on those ports
[entryPoints]
  [entryPoints.http]
  address = ":80"
  compress = true
  [entryPoints.https]
  address = ":443"
  compress = true
    [entryPoints.https.tls]
```

I'm now able to test it with:

```bash
cd /etc/docker/compose/traefik/
docker-compose up
```

Port 80 and 443 should be open of course and they should now answer. The admin WebUI port is not open from the outside so you need a VPN or an SSH tunnel to access it for example.

Once your configuration works as expected, you enable this docker compose as a service:

```bash
systemctl enable docker-compose@traefik
systemctl start docker-compose@traefik
```

# Wordpress configuration

For Wordpress, the documentation recommended to mount only some folders (like plugins and uploads). However, I do not especially recommand it because you'll need to restart the container with a newer version anytime you want to upgrade it. That's why I'm mounting all the Wordpress folder. This is not the "Container way" theory with immutable images, but from a pragmatic point of view, I prefer having a Wordpress always up to date (with dedicated plugin managing the upgrade of all components) instead of having a process managing the upgrade of my containers like [Watchtower][11]. That's my choice and point of view, I know that other persons would choose the other solution, so select the most appropriate one.

Here is my config:

```yaml
version: '3'
services:
  # Required MariaDB instance with mounted volumes
  mysql:
    image: mariadb:10.3.11
    restart: always
    volumes:
      - ./conf/mariadb:/etc/mysql/mariadb.conf.d
      - /mnt/container/wordpress/mariadb:/var/lib/mysql
    networks:
      - frontend
    environment:
      MYSQL_ROOT_PASSWORD: password
  # Wordpress:expose it using labels with defined rule name
  wordpress:
    image: wordpress:5.0.0-php7.1
    restart: always
    labels:
      traefik.enable: true
      traefik.tags: web
      traefik.frontend.rule: 'Host:test.fqdn.com'
      traefik.frontend.entryPoints: https
    # Need this network to allow traefik redirect to it
    networks:
      - frontend
    ports:
      - "8080:80"
    volumes:
      - ./conf/php/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
      - /mnt/container/wordpress/wordpress:/var/www/html
    environment:
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_NAME: wordpress
    links:
      - mysql
    depends_on:
      - mysql
networks:
  frontend:
    external: true
```

*Note: if you're using it this way like me, the very first time, you'll need to copy a wordpress content from the container to your volume. Otherwise, your Wordpress volume will be empty.*

Same as Traefik, I'm now able to test it with:

```bash
cd /etc/docker/compose/wordpress/
docker-compose up
```

It should be now accessible from https://test.fqdn.com. You can double check on the Traefik WebUI if your service is correctly exposed to the outside.

Once your configuration works as expected, you enable this docker compose as a service:

```bash
systemctl enable docker-compose@wordpress
systemctl start docker-compose@wordpress
```

I've finished with it. It's a simple and smart way to manage containers on a single server, it's repetable. Do not forget to backup your data, configuration files and you're good to go.

Hope this helped

 [1]: https://wiki.deimos.fr/VServer_:_Mise_en_place_de_VServer
 [2]: https://wiki.deimos.fr/OpenVZ_:_Mise_en_place_d'OpenVZ
 [3]: https://wiki.deimos.fr/KVM_:_Mise_en_place_de_KVM
 [4]: https://wiki.deimos.fr/LXC_:_Install_and_configure_the_Linux_Containers
 [5]: https://www.docker.com/
 [6]: https://kubernetes.io/
 [7]: https://docs.docker.com/compose/
 [8]: https://docs.docker.com/install/linux/docker-ce/debian/
 [9]: https://letsencrypt.org/
 [10]: https://traefik.io/
 [11]: https://github.com/v2tec/watchtower
