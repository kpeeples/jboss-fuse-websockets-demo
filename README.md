JBoss Fuse WebSocket HTML 5 Demo Quickstart Guide
=================================================

Demo based on JBoss Fuse product.

Setup and Configuration
-----------------------

See Quick Start Guide in project as ODT and PDF for details on installation. For those that can't wait:

- see README in 'installs' directory

- add product 

- run 'init.sh' & read output

- read Quick Start Guide (coming soon).

- setup JBDS for project import, add jboss-fuse server (coming soon).

- import projects

- start JBoss Fuse using the shell or .bat script under bin directory bin/fuse
	
[kpeeples@localhost bin]$ ./fuse
Please wait while JBoss Fuse is loading...
100% [========================================================================]

      _ ____                  ______
     | |  _ \                |  ____|
     | | |_) | ___  ___ ___  | |__ _   _ ___  ___
 _   | |  _ < / _ \/ __/ __| |  __| | | / __|/ _ \
| |__| | |_) | (_) \__ \__ \ | |  | |_| \__ \  __/
 \____/|____/ \___/|___/___/ |_|   \__,_|___/\___|

  JBoss Fuse (6.0.0.redhat-014)
  http://www.redhat.com/products/jbossenterprisemiddleware/fuse/

Hit '<tab>' for a list of available commands
and '[cmd] --help' for help on a specific command.
Hit '<ctrl-d>' or 'osgi:shutdown' to shutdown JBoss Fuse.

JBossFuse:karaf@root> 

- when the JBoss Fuse console appears, install the activemq-websocket war file. This war file contains the web project and stomp javascript clients used to open communication between the web browser and websocket server running in JBoss Fuse.

    JBossFuse:karaf@root>install -s war:mvn:org.jboss.amq.examples.websocket/web/1.0/war\?Webapp-Context=activemq-websocket

- start Feeder application, which will populate randomly data (stock prices) and publish them in a topic which is the  topic used by websocket to expose the date to the web browser. You will find this in the 'support' directory.

    start_feeder.sh

- open your web browser and point to the following URL:  http://localhost:8181/activemq-websocket/stocks-activemq.html

- click on connect button, login is 'guest':'password'

- consult stock prices!


Released versions
-----------------
See the tagged releases for the following verisons of the product:

- v1.0 is initial JBoss Fuse v6 release.

