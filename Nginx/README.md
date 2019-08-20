# Https-Proxy-IRIS-Docker with Nginx
Sample of an Https proxy for Intersystems Iris

## Run
```
docker-compose up -d
```

## How it works

The dockerfile works in 2 steps :
* Make a self-signed certificate
* Make the config file for the Nginx proxy

The docker-compose :
* Configure arguments of the dockerfile
  * link of the IRIS docker
  * port of the IRIS docker
* Run Nginx
* Run IRIS Community Edition
