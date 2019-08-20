# Https-Proxy-IRIS-Docker with Apache
Sample of an Https proxy for Intersystems Iris

## Run
```
docker-compose up -d
```

## How it works
The dockerfile works in 3 steps :
* Make a self-signed certificate
* Load modules
  * For proxy mode
  * For SSL
* Make config file for the proxy

