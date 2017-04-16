---
title: Zero downtime upgrade with Ansible and HAProxy
author: Deimos
type: post
date: 2016-01-21T13:00:16+00:00
url: /2016/01/21/zero-downtime-upgrade-with-ansible-and-haproxy/
image: /images/logo_ansible.png
thumbnailImage: /thumbnails/logo_ansible.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Ansible
  - Debian
  - Docker
  - HA
  - Hi-Tech
  - Linux
  - Nousmotards
  - Red Hat
tags:
  - Ansible
  - Debian
  - Docker
  - HA
  - Hi-Tech
  - Linux
  - Nousmotards
  - Red Hat

---
![ansible_logo](/images/logo_ansible.png)
Some of you may not be familiar with the terms "**Rolling upgrade**" or "**Rolling restart**". This is the action of upgrading or restarting a cluster without service interruption (alias **zero downtime**). In most cases, this is done node by node, but in fact it depends of the technology you're managing and the number of active nodes in your cluster.

At [Nousmotards](http://www.nousmotards.com)  we have several Java [Spring Boot](http://www.springbot.com/) applications running. **Restarting one application can take up to 1 min**. During that time, the service was down which is a shame when you make multiple deployments during per day. To avoid this, I've wrote an [Ansible](http://www.ansible.com/) playbook to perform a **rolling upgrade with the help of** [HAProxy](https://wiki.deimos.fr/HAProxy:_load_balance_your_traffic). I'm going to share it with you and explain in details how it works.

First of all, you need to understand our infrastructure. Regarding our Java micro services, each one is running at least two instances and a load balancer is in front in active/active mode. All our applications are stateless which help us to avoid taking care of the data. Here is a simplified example of our infrastructure for a single Java app:

![nm_haproxy_all](/images/nm_haproxy_all.png)

{{< highlight yaml >}}
---

- hosts: "{{nm_app}}"
  user: root
  serial: 1
  any_errors_fatal: True
{{< /highlight >}}

Here you can see the _hosts_ parameter as a variable (nm_app is the name of the application and the container dns name as well) because I don't want something specific but applicable to any kind of application. This variable is in fact a group of machines pulled out from Consul (it can be from a flat file).

The _serial_ means that **it should not perform those tasks on several hosts in parallel (limit to 1 host at a time)**. If you've got a large set of machines, you can define a percentage. **This will stop upgrading/restarting if it fails at some point**.

The _any\_errors\_fatal_ parameter **ensures me that it will stop if an issue occur**. I personally prefer to manually repair the issue in case of a failure rather than putting the service down and perform a full restart. It's a security option.

{{< highlight yaml >}}
pre_tasks:

    - name: read haproxy config to catch if nm app is available
      shell: 'echo "show stat" | socat {{haproxy_socks}} stdio | grep -c "^{{nm_app}}"'
      delegate_to: "{{ srv_role_location[nm_app] }}"
      ignore_errors: true
      register: app_in_haproxy

{{< /highlight >}}

Here I'm running _pre_tasks_ to get out the application from Haproxy (meaning setting it in maintenance mode, so no new connections will be established on this application). For this first task, I just want to be sure that the application I'm requesting is registered in Haproxy to avoid playbook failure during next steps.
  
Of course, Haproxy is not on the same host as the application, that's why I'm using the _delegate_to_ parameter pointing to a dictionary with the host information of the application (which, in my case, is running inside a Docker container but can be triggered from anywhere like Consul kv).

The result is stored in the _app\_in\_haproxy_ variable. Now the idea is to **set Haproxy for this current host in maintenance mode and stop the service** to get something like this:

![nm_haproxy_right](/images/nm_haproxy_right.png)

{{< highlight yaml >}}
- name: disabling application on the load balancer
      haproxy:
        host: "{{ ansible_nodename }}"
        socket: "{{ haproxy_socks }}"
        state: disabled
      delegate_to: "{{ srv_role_location[nm_app] }}"
      when: app_in_haproxy.stdout != '0'

    - name: disabling application on monit
      command: "monit stop {{nm_app}}"
      register: monit_stop_result
      until: monit_stop_result.rc == 0
      retries: 120
      delay: 10

{{< /highlight >}}

I'm using [Monit to manage the services inside Docker](https://blog.deimos.fr/2016/01/13/docker-why-you-should-use-monit-instead-of-supervisord/). That's why I stop the service managed by Monit (Note that I'm not using the _monit_ module in Ansible because it's buggy). Then I'm waiting for the port application to be closed. That way, I'm sure it will be gracefully stopped and no clients will be connected anymore:

{{< highlight yaml >}}
- name: Waiting application to be stopped
      wait_for:
        host: '127.0.0.1'
        port: "{{nm_java_apps_params[nm_app]['port']}}"
        state: stopped
        delay: 1
        timeout: 1200

{{< /highlight >}}

Now I'm calling a role that will ensure my application is installed with the good version. If it's not the case, it will perform the upgrade:

{{< highlight yaml >}}
roles:
    - role: java-application
      app_name: "{{nm_app}}"
      enable_monit_restart: false

{{< /highlight >}}

When finished, the new application is deployed. We can now **start everything in reverse order**:

{{< highlight yaml >}}
post_tasks:
    - name: enabling application on monit
      command: "monit start {{nm_app}}"
      register: monit_start_result
      until: monit_start_result.rc == 0
      retries: 120
      delay: 10

    - name: Waiting application to be up
      wait_for:
        host: '127.0.0.1'
        port: "{{nm_java_apps_params[nm_app]['port']}}"
        state: started
        delay: 1
        timeout: 1200

    - name: enabling application on the load balancer
      haproxy:
        host: "{{ ansible_nodename }}"
        socket: "{{ haproxy_socks }}"
        state: enabled
      delegate_to: "{{srv_role_location.nm_app}}"
      when: app_in_haproxy.stdout != '0'

{{< /highlight >}}

To be sure Haproxy had enough time to switch to the green state, I'm triggering the state for 20s and only continue when green. This is normally **not necessary but a useful guaranty tip**:

{{< highlight yaml >}}
- name: waiting haproxy to be green
      shell: 'echo "show stat" | socat {{haproxy_socks}} stdio | grep {{ansible_hostname}} | grep -c UP'
      register: haproxy_green
      until: haproxy_green.stdout != 1
      retries: 20
      delay: "1"
      delegate_to: "{{ srv_role_location[nm_app] }}"
      when: app_in_haproxy.stdout != '0'

{{< /highlight >}}

This host is now delivering the latest version of the application, **Ansible will now continue with the others hosts one by one**:

![nm_haproxy_left](/images/nm_haproxy_left.png)

When finished, **all apps are upgraded without any downtime** and no stress.

This kind of solution is not new, but with the help of Ansible, it becomes really easy.