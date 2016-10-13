FROM ubuntu:xenial

RUN echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
RUN echo "deb http://dl.bintray.com/roadrunnr/ergw xenial main" > /etc/apt/sources.list.d/ergw-xenial-bintray.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 379CE192D401AB61

RUN apt-get update && apt-get -y install build-essential debhelper \
    git rebar3 erlang-dev erlang-tools \
    erlang-syntax-tools erlang-eunit \
    erlang-inets erlang-snmp \
    erlang-dialyzer erlang-ssl

RUN mkdir /build
WORKDIR /build
