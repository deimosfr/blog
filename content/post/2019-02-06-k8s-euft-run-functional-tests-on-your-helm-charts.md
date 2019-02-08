---
author: Deimos
type: post
url: /2019/02/08/k8s-euft-run-functional-tests-on-your-helm-charts/
categories:
  - linux
  - kubernetes
  - vagrant
  - virtualbox
  - helm
  - chart
  - travis
  - docker
date: 2019-02-08T00:00:00+02:00
tags:
  - linux
  - kubernetes
  - vagrant
  - virtualbox
  - helm
  - chart
  - travis
  - docker
image: /images/logo_helm.png
thumbnailImage: /thumbnails/logo_helm.png
thumbnailImagePosition: left
title: "k8s-euft: run functional tests on your Helm charts"
url: /2019/02/08/k8s-euft-run-functional-tests-on-your-helm-charts/

---

![Kubernetes](/images/logo_kubernetes.png)

I'm managing applications inside [Kubernetes][1] for more than 2 years for [MySocialApp][3] a social news feed solution and recently [Referlab][4], an impressive referral marketing solution. If you follow me, you certainly know that I've made multiple [Helm charts][2] on distributed technologies like:

* [Cassandra Helm chart][5]
* [Elasticsearch Helm chart][7]
* [Traefik Helm chart][6]

After several years of experience on it, you can trust me when I say **managing statefulset on Kubernetes is not the easiest thing to do**. Moreover when you're not on a cloud Kubernetes version with facilities like distributed shared storage. It's one step harder. **If you're not able to test the behavior of your distributed application, you can be sure it's born to fail**.

That's why I started to look at a testing framework made for Kubernetes to test the behavhior of the running applications in some circumstances. Unfortunately, I didn't find anything. That's why I decided to make something simple, maintainable, locally testable. I've create: [K8s End User Funtional Testing, aka k8s-euft][0]. In this blog post I'll explain how it works and why I've made some choices.

# Setup

Hands on! Next to a chart, simply create a tests folder and add this repository as a submodule (or clone it if you don't want to use submodules):

```bash
mkdir tests && cd tests
git submodule add https://github.com/MySocialApp/k8s-euft.git
cat k8s-euft/examples/.gitignore >> ../.gitignore
```

Here is a common example on what the hierarchy of your helm chart with k8s-euft looks like:
```
.
├── kubernetes
│   ├── Chart.yaml
│   ├── templates
│   │   ├── configmap-configs.yaml
│   │   ├── configmap-scripts.yaml
│   │   ├── _helpers.tpl
│   │   ├── NOTES.txt
│   │   ├── pdb.yaml
│   │   ├── service.yaml
│   │   └── statefulset.yaml
│   └── values.yaml
├── LICENSE
├── OWNERS
├── README.md
└── tests
    ├── configs
    │   └── default.yaml
    ├── k8s-euft
    │   ├── bootstrap_k8s.sh
    │   ├── ...
    │   └── travis-exec.go
    ├── play
    │   ├── common.bash
    │   ├── deploy.bats
    │   ├── prepare.bats
    │   ├── remove_chart.bats
    │   └── upgrade.bats
    ├── README.md
    ├── run_tests.sh
    └── Vagrantfile
```

The kubernetes folder contains your helm chart and the test folder is next to it.

# Bats tests

As you can see above, there are some `*.bats` files in the `play` folder. Most of my tests are in bash for simplicity (but you can chose any other language/solution for it) and I'm using [bats][13] (Bash Automated Testing System) to make it **even more simple**.

> Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.

I've split bats files regading the functions I want to run. This make it **easily reusable**.

# Local and Remote tests integration

**Being able to quickly test locally and remotely in an isolated and reproductible environment is mandatory**. That's why I've decided to use:

* For remote testing: [Travis][8] is one of the most used, free, CI solution. Linked to GitHub, is fast to setup automated tests.
* For local testing: Using [Vagrant][10] is standard enough to easily launch a VM running all the required tests on your local computer.

I've made a simple Go script for local tests which is in a fact a really basic `.travis.yml` parser. Its goal is to look at environment variables it has to load and tasks it has to run. This way I don't have to write 2 differents ways to execute the tests (one for local and one for remote) but only: the Travis one.

Taking as an example a Travis configuration file:

```yaml
---
language: go
sudo: required

env:
  - K8S_VERSION=1.12 HELM_VERSION=2.12.3 NUM_NODES=3 SKIP_SNAPSHOT=y PATH="$HOME/.kubeadm-dind-cluster:/tmp/linux-amd64:$PATH"
  - K8S_VERSION=1.11 HELM_VERSION=2.12.3 NUM_NODES=3 SKIP_SNAPSHOT=y PATH="$HOME/.kubeadm-dind-cluster:/tmp/linux-amd64:$PATH"

install:
  - tests/k8s-euft/helm.sh local_install || exit 1
  - bats tests/k8s-euft/helm_lint.bats || exit 1
  - tests/k8s-euft/bootstrap_k8s.sh || exit 1
  - tests/k8s-euft/helm.sh install || exit 1

script:
  - tests/run_tests.sh
```

Here you can define (in the `env` section) the version of Kubernetes you want to run, the version of helm that should be installed, the number of kubernetes nodes (workers) you want to run etc...to finally run the tests script (`run_tests.sh`).

Not complicated right? How Kubernetes is installed? I'm using [Kubeadm Dind Cluster][9], a script launching a quick install of Kubernetes in [Docker][11], you get it ready in few min. Note: If you want to install older Kubernetes version, you can pin the Kubeadm Dind Cluster repo to a Tag/Branch/Git commit with `GIT_REV` variable in the `env` section.

# Vagrant

The Vagrantfile will look like this:

```ruby
Vagrant.configure("2") do |config|

  config.vm.box = "deimos_fr/debian-stretch"
  #config.vm.box = "geerlingguy/centos7"

  config.vm.synced_folder "..", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
      vb.cpus = 4
      vb.memory = "4096"
  end

  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant_data
    source tests/k8s-euft/env.bash
    tests/k8s-euft/prerequisites.sh
    go run tests/k8s-euft/travis-exec.go .travis.yml
  SHELL
end
```

Really basic, not a lot of operation to execute and repeatable. As I'm using Vagrant, the most common option to run the VM is [Virtualbox][12]. But Vagrant is also able to use other providers, so you can easily run those tests in the cloud for instance :)

# Run your tests

Now you're good to go, let's go inside the `tests` folder and run vagrant:

```bash
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[...]
    default: [+] Running command: tests/run_tests.sh
    default:
    default: ########################################
    default: Prepare cluster
    default: ########################################
    default: 1..2
    default: ok 1 Ensure number of nodes is set: 3
    default: ok 2 Ensure nodes has correct labels
    default:
    default: ########################################
    default: Regular Couchbase deploy
    default: ########################################
    default: 1..4
[...]
    default: All tests passed :)
```

To conclude, it's KISS and agile, I'm using this on several projects with success. You can find some examples here:

* [Cassandra Helm chart][5]
* [Elasticsearch Helm chart][7]
* [Traefik Helm chart][6]

I hope you'll be happy to get something as well. Feel free to contribute :)

 [0]: https://github.com/MySocialApp/k8s-euft
 [1]: https://kubernetes.io/
 [2]: https://helm.sh/
 [3]: https://mysocialapp.io/
 [4]: https://www.referlab.io/
 [5]: https://github.com/MySocialApp/kubernetes-helm-chart-cassandra
 [6]: https://github.com/MySocialApp/kubernetes-helm-chart-traefik
 [7]: https://github.com/MySocialApp/kubernetes-helm-chart-elasticsearch/tree/es6
 [8]: https://travis-ci.org/
 [9]: https://github.com/kubernetes-sigs/kubeadm-dind-cluster
 [10]: https://www.vagrantup.com/
 [11]: https://www.docker.com/
 [12]: https://www.virtualbox.org/
 [13]: https://github.com/bats-core/bats-core
