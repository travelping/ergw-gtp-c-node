FROM ubuntu:xenial

RUN apt-get update && apt-get -y install curl apt-transport-https

RUN echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
RUN echo "deb https://packagecloud.io/ergw/ci/ubuntu/ xenial main" > /etc/apt/sources.list.d/ergw-packagecloud.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
RUN curl -L https://packagecloud.io/ergw/ci/gpgkey | apt-key add -

RUN apt-get update && apt-get -y install build-essential debhelper \
    git rebar3 erlang-base-hipe erlang-dev erlang-tools \
    erlang-syntax-tools erlang-eunit \
    erlang-inets erlang-snmp \
    erlang-dialyzer erlang-ssl

RUN mkdir /build
WORKDIR /build
