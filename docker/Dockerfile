# -- build-environment --
# see https://docs.docker.com/engine/userguide/eng-image/multistage-build/

FROM erlang:21.0.3-alpine AS build-env

WORKDIR /build
RUN     apk update && apk --no-cache upgrade && \
		apk --no-cache add \
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

FROM alpine:3.8

WORKDIR /
RUN     apk update && \
		apk --no-cache upgrade && \
		apk --no-cache add zlib ncurses-libs libcrypto1.0 lksctp-tools
COPY    docker/docker-entrypoint.sh /
COPY    config/ergw-gtp-c-node.config /etc/ergw-gtp-c-node/

RUN     mkdir -p /var/lib/ergw/ && \
		touch /var/lib/ergw/ergw.state

COPY    --from=build-env /build/_build/prod+native/rel/ /opt/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD     ["/opt/ergw-gtp-c-node/bin/ergw-gtp-c-node", "foreground"]
