# Dockerfile can be found at https://github.com/travelping/ergw-docker-base
FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod+native/rel/ /opt/rel/
COPY docker/ergw-gtp-c-start.sh /opt/
# Create folder for statefiles
RUN mkdir -p /var/lib/ergw/ && touch /var/lib/ergw/ergw.state

ENTRYPOINT ["sh", "-c", "/opt/ergw-gtp-c-start.sh"]
CMD ["/opt/rel/ergw-gtp-c-node/bin/ergw-gtp-c-node foreground"]
