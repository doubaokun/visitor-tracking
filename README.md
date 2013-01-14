##Introduction

A simple visitor tracking application powered by node.js. 

## Configuration and installation

Change the port and log location in the file `config.coffee`

    exports.config = 
      http:
        port: 3002
      log:
        location: "./log.txt"

Install the depended modules:

    sudo npm install -d

Start the application:

    npm start

Stop the application:

    forever stopall

Add more configuration into Nginx:

    location ~ ^/_\..*$ {
      proxy_pass      http://tracking_app/;
      proxy_redirect off;
    }
    
    upstream tracking_app {
      server 127.0.0.1:3200;
    }

Embe the JavaScript tracking code on your webpages:

    <script type="text/javascript" src="/_.js"></script>
