FROM php:5.6-fpm

# Install container dependencies
RUN apt-get update && apt-get install -y \
  git \
  unzip \
  libmagickwand-dev \
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

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Copy php config
COPY config/php.ini /usr/local/etc/php/

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    SYMFONY__DATABASE_DRIVER="pdo_mysql" \
    SYMFONY__DATABASE_HOST="mysqldb" \
    SYMFONY__DATABASE_PORT="3306" \
    SYMFONY__DATABASE_NAME="armycreator" \
    SYMFONY__DATABASE_USER="root" \
    SYMFONY__DATABASE_PASSWORD="root" \
    SYMFONY__DATABASE_NAME_FORUM="armycreator" \
    SYMFONY__DATABASE_NAME_ACL="armycreator" \
    SYMFONY__MAILER_TRANSPORT="smtp" \
    SYMFONY__MAILER_HOST="localhost" \
    SYMFONY__MAILER_USER="" \
    SYMFONY__MAILER_PASSWORD="" \
    SYMFONY__LOCALE="fr" \
    SYMFONY__SECRET="QKnWBZZDHlfyBlvNrNDe" \
    SYMFONY__FORUM_SID="forum_ac_sid" \
    SYMFONY__DOMAIN__WEBSITE="localhost" \
    SYMFONY__DOMAIN__API="api.127.0.0.1.xip.io" \
    SYMFONY__DOMAIN__OAUTH2="oauth2.127.0.0.1.xip.io" 
    #donation_parameters:•
    #    cmd=_s-xclick
    #    hosted_button_id=L7PK6V4R4LPHG

WORKDIR /var/www/armycreator
