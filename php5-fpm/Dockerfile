FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
  git \
  unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"
COPY config/php.ini /usr/local/etc/php/

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN echo 'alias sf="php app/console"' >> ~/.bashrc


WORKDIR /var/www/armycreator
