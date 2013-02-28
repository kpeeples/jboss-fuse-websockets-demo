#!/bin/sh

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

echo
echo Starting Camel with SSL.
echo
cd ../projects/websocket-activemq-camel/camel
mvn camel:run -P SSL
