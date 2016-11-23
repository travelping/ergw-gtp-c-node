ergw-gtp-c-node
===============

[![Build Status](https://travis-ci.org/travelping/ergw-gtp-c-node.svg?branch=master)](https://travis-ci.org/travelping/ergw-gtp-c-node)

OTP application to package a erGW GTP-C Node.

Installing on Ubuntu 16.04
--------------------------

Package for Ubuntu 16.04 are build on every commit to this repository and uploaded to bintray. In order to install them do this:

    sudo echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
    curl -s https://packagecloud.io/install/repositories/ergw/ci/script.deb.sh | sudo bash
    apt-get -y install ergw-gtp-c-node

After installation adjust /opt/ergw-gtp-u-node/releases/<version>/sys.config

Build
-----

    $ rebar3 compile


Docker container images
------------------------

This repository creates also a [Docker image](https://hub.docker.com/r/grundrausch3n/ergw-gtp-c-node-base/) which can be used as a base component to create several differnt architechtures.
At the time of writing we recommend to use it just for testing and
development.
It uses the host network for now and needs network interfaces to be configured
beforehand.

To add the custom configuration to the container, a volume should be mounted
to `/config/ergw-gtp-c-node` containing the `sys.config` and `vm.args` erlang
config.

An example can be found at
<https://github.com/travelping/ergw-gtp-c-node-docker>
