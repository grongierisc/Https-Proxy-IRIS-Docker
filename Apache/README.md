# Https-Proxy-IRIS-Docker with Apache
Sample of an Https proxy for Intersystems Iris

## Run
```
docker-compose up -d
```

## How it works
The dockerfile works in 3 steps :
* Load modules
  * For proxy mode
  * For SSL
* Make the config file for the proxy
* Make a self-signed certificate
