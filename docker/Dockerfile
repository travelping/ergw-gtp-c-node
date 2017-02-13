# Dockerfile can be found at https://github.com/travelping/ergw-docker-base
FROM ergw/ergw-docker-base

WORKDIR /
COPY _build/prod+native/rel/ /opt/
COPY docker/docker-entrypoint.sh /
COPY config/ergw-gtp-c-node.config /etc/ergw-gtp-c-node/
# Create folder for statefiles
RUN mkdir -p /var/lib/ergw/ && touch /var/lib/ergw/ergw.state

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/ergw-gtp-c-node/bin/ergw-gtp-c-node", "foreground"]
