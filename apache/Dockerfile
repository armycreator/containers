FROM debian:jessie

# needed for installing libapache2-mod-fastcgi
RUN echo 'deb http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-fastcgi

ADD conf-available /etc/apache2/conf-available
RUN a2enconf servername

# activate proxy and proxy_fcgi to interoperate with PHP-FPM
RUN a2enmod \
    proxy \
    proxy_fcgi \
    ssl \
    headers \
    setenvif \
    mime \
    rewrite \
    deflate \
    filter \
    expires

# removing default configuration
RUN rm /etc/apache2/sites-enabled/*



# RUN usermod -u 1000 www-data

# RUN /usr/sbin/apache2ctl -D FOREGROUND

# COPY server.crt /usr/local/apache2/conf/
# COPY server.key /usr/local/apache2/conf/
# RUN echo 'Include conf/extra/httpd-ssl.conf' >> ~/.bashrc

# Set Apache environment variables (can be changed on docker run with -e)
ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_PID_FILE=/var/run/apache2.pid \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_SERVERADMIN=admin@localhost \
    APACHE_SERVERNAME=localhost \
    APACHE_SERVERALIAS=docker.localhost \
    APACHE_DOCUMENTROOT=/var/www

# activate armycreator's vhost file
ADD armycreator.conf /etc/apache2/sites-available/

RUN a2ensite armycreator

EXPOSE 80 443

CMD ["apache2", "-D", "FOREGROUND"]
