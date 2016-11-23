#!/bin/sh
# copy of configuration files
RELPATH=$(find /opt/rel/ergw-gtp-c-node/releases/ -mindepth 1 -maxdepth 1 -type d)
[ -f /config/ergw-gtp-c-node/sys.config ] && cp /config/ergw-gtp-c-node/sys.config $RELPATH/sys.config
[ -f /config/ergw-gtp-c-node/vm.args ] && cp /config/ergw-gtp-c-node/vm.args $RELPATH/vm.args

$1
