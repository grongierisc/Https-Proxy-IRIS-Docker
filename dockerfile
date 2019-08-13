FROM httpd
LABEL maintainer="Guillaume Rongier <guillaume.rongier@intersystems.com>"

ARG link
ARG port
ENV _HTTPD_DIR /usr/local/apache2

RUN sed -i 's,^#\(LoadModule proxy_module modules/mod_proxy.so\)$,\1,' $_HTTPD_DIR/conf/httpd.conf
RUN sed -i 's,^#\(LoadModule proxy_http_module modules/mod_proxy_http.so\)$,\1,' $_HTTPD_DIR/conf/httpd.conf
RUN sed -i 's,^#\(LoadModule ssl_module modules/mod_ssl.so\)$,\1,' $_HTTPD_DIR/conf/httpd.conf
RUN sed -i 's,^#\(LoadModule socache_shmcb_module modules/mod_socache_shmcb.so\)$,\1,' $_HTTPD_DIR/conf/httpd.conf
RUN sed -i 's,^#\(Include conf/extra/httpd-ssl.conf\)$,\1,' $_HTTPD_DIR/conf/httpd.conf
RUN echo 'Include conf/other/*.conf' >> $_HTTPD_DIR/conf/httpd.conf

RUN mkdir -p $_HTTPD_DIR/conf/other
RUN echo 'ProxyRequests Off' > $_HTTPD_DIR/conf/other/iris.conf
RUN echo "ProxyPass / http://$link:$port/" >> $_HTTPD_DIR/conf/other/iris.conf
RUN echo "ProxyPassReverse / http://$link:$port/" >> $_HTTPD_DIR/conf/other/iris.conf

RUN apt-get update
RUN apt-get install openssl
RUN openssl req -x509 -nodes -days 1 -newkey rsa:2048 -subj /CN=* -keyout /usr/local/apache2/conf/server.key -out /usr/local/apache2/conf/server.crt
