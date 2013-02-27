# Example showing How to use WebSocket HTML 5 with JBoss Fuse

1) Start JBoss Fuse ESB with or without SSL, using file found in 'suppport' directory.

   start_jbossfuse_nossl.sh  or  start_jbossfuse_ssl.sh

2) Start Feeder application

   start_feeder.sh

3) Verify stock and news websockets in your browser.

    http://localhost:9090/stocks-camel.html
    http://localhost:9090/news-camel.html

    or 

    https://localhost:8443/news-camel-wss.html

    and click on connect button.

