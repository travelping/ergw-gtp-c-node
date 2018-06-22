ergw-gtp-c-node
===============

[![Build Status](https://travis-ci.org/travelping/ergw-gtp-c-node.svg?branch=master)](https://travis-ci.org/travelping/ergw-gtp-c-node)

OTP application to package a erGW GTP-C Node.

Build
-----

    $ rebar3 compile


Docker images
-------------

This repository creates also a [Docker
image](https://hub.docker.com/r/ergw/ergw-gtp-c-node/) which can be used as a
base for other images to create systems for different purposes, e.g. GGSN,
PDN-GW, GTP-proxy.  At the time of writing we recommend to use this base image
for testing and development. You can use the host network and need network
interfaces to be configured beforehand.

To add a custom configuration to the container, a volume may be mounted
to `/config/ergw-gtp-c-node` containing the `sys.config` and `vm.args` erlang
config. Alternatively, you may use a volume to provide the configuration in
`/etc/erlang-gtp-c-node/erlang-gtp-c-node.config` or alter this file in
a running container.
