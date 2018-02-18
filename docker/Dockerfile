# -- build-environment --
# see https://docs.docker.com/engine/userguide/eng-image/multistage-build/

FROM alpine:3.7 AS build-env

WORKDIR /build
RUN     apk update && apk --no-cache upgrade && \
	apk --no-cache add \
	    erlang \
		erlang-asn1 erlang-compiler erlang-crypto erlang-dev \
		erlang-diameter erlang-eunit erlang-hipe erlang-inets \
		erlang-kernel erlang-parsetools erlang-public-key \
		erlang-os-mon \
		erlang-runtime-tools erlang-sasl erlang-ssl erlang-stdlib \
		erlang-syntax-tools \
	    gcc \
	    git \
	    libc-dev libc-utils \
	    libgcc \
	    linux-headers \
	    make \
	    musl-dev musl-utils \
	    pcre2 \
	    pkgconf \
	    scanelf \
	    wget \
	    zlib

RUN     wget -O /usr/local/bin/rebar3 https://s3.amazonaws.com/rebar3/rebar3 && \
	chmod a+x /usr/local/bin/rebar3

ADD     . /build
RUN     rebar3 as prod,native release

# -- runtime image --

FROM    alpine:3.7

WORKDIR /
RUN     apk update && \
	apk --no-cache upgrade && \
	apk --no-cache add ncurses-libs libcrypto1.0
COPY    docker/docker-entrypoint.sh /
COPY    config/ergw-gtp-c-node.config /etc/ergw-gtp-c-node/

RUN     mkdir -p /var/lib/ergw/ && \
	touch /var/lib/ergw/ergw.state

COPY    --from=build-env /build/_build/prod+native/rel/ /opt/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD     ["/opt/ergw-gtp-c-node/bin/ergw-gtp-c-node", "foreground"]
