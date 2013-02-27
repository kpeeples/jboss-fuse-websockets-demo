#!/bin/sh 
DEMO="JBoss Fuse Websocket Demo"
VERSION=6.0.0
FUSE=jboss-fuse-6.0.0.redhat-009
FUSE_BIN=jboss-fuse-full-6.0.0.redhat-009.tar.gz
DEMO_HOME=./target
FUSE_HOME=$DEMO_HOME/$FUSE
SERVER_CONF=$FUSE_HOME/etc
SRC_DIR=./installs
PRJ_DIR=./projects/websocket-activemq-camel


echo
echo "Setting up the Red Hat ${DEMO} environment..."
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$FUSE_BIN || -L $SRC_DIR/$FUSE_BIN ]]; then
		echo JBoss Fuse sources are present...
		echo
else
		echo Need to download $FUSE_BIN package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi


# Create the target directory if it does not already exist.
if [ ! -x $DEMO_HOME ]; then
		echo "  - creating the demo home directory..."
		echo
		mkdir $DEMO_HOME
else
		echo "  - detected demo home directory, moving on..."
		echo
fi


# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $FUSE_HOME ]; then
		echo "  - existing JBoss Fuse detected..."
		echo
		echo "  - moving existing JBoss Fuse aside..."
		echo
		rm -rf $FUSE_HOME.OLD
		mv $FUSE_HOME $FUSE_HOME.OLD

		# Unzip the JBoss Fuse instance.
		echo Unpacking JBoss FUSE $VERSION
		echo
		tar -zxf $SRC_DIR/$FUSE_BIN 
		mv $FUSE $DEMO_HOME
else
		# Unzip the JBoss Fuse instance.
		echo Unpacking new JBoss Fuse...
		echo
		tar -zxf $SRC_DIR/$FUSE_BIN
	  mv $FUSE $DEMO_HOME
fi


echo "  - enabling demo accounts logins in users.properties file..."
echo
cp support/users.properties $SERVER_CONF

echo "  - copying updated JBoss Fuse configuration file fuseFUSE-websocket.xml from project..."
echo
cp projects/websocket-activemq-camel/feeder/src/main/config/activemq-websocket.xml $SERVER_CONF/activemq.xml

echo "  - making sure 'Fuse' for server is executable..."
echo
chmod u+x $FUSE_HOME/bin/fuse

echo Now going to build the Feeder project.
echo
cd $PRJ_DIR/feeder
mvn clean install -DskipTests

echo
echo Now going to build the Camel project.
echo
cd ../camel
mvn clean install -DskipTests

echo
echo To get started see the README.md file:
echo
cd ../../..
cat README.md

echo Red Hat $DEMO $VERSION Setup Completed.
echo

