FROM php:5.6-fpm

# COnfigure NodeJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

# Install container dependencies
RUN apt-get update && apt-get install -y \
  git \
  unzip \
  libmagickwand-dev \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN pecl install imagick-3.4.1 \
    && docker-php-ext-enable imagick

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

RUN echo 'alias sf="php app/console"' >> ~/.bashrc

# Install bower
RUN npm install -g bower

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Copy php config
COPY config/php.ini /usr/local/etc/php/

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/armycreator
