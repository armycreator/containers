#!/bin/bash

WORKING_DIR="/var-www/armycreator"
VOLUME="$(pwd)/../armycreator-website:$WORKING_DIR"

function init() {
    docker-compose exec php5 php /usr/local/bin/composer install
    # docker run -v "$VOLUME" -w $WORKING_DIR --rm composer:latest install
    docker run -v "$VOLUME" -w $WORKING_DIR --rm node:6 npm install
    docker run -v "$VOLUME" --rm node:6 "$WORKING_DIR/node_modules/.bin/bower install"
    docker-compose exec php5 php app/console doctrine:migrations:migrate
}

function composer() {
    # docker run -v "$VOLUME" -w $WORKING_DIR --rm composer:latest composer $1
    docker-compose exec php5 php /usr/local/bin/composer $1
}

if [ $1 = "init" ]
then
    init
elif [ $1 = "composer" ]
then
    composer $2
fi
