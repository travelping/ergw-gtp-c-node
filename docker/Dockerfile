FROM grundrausch3n/ergw-docker-base

WORKDIR /
COPY _build/prod+native/rel/ /opt/rel/
COPY docker/ergw-gtp-c-start.sh /usr/bin/
# Create folder for statefiles
RUN mkdir -p /var/lib/ergw/ && touch /var/lib/ergw/ergw.state

CMD ["ergw-gtp-c-start.sh"]
