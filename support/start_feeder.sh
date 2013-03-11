#!/bin/sh

PRJ_DIR=../projects/jboss-fuse-websocket-demo/feeder
MVN_CMD='mvn -P run-trader'

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

echo
echo Starting Feeder application.
echo
cd $PRJ_DIR
$MVN_CMD
