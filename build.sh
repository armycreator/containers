#!/bin/bash

WORKING_DIR="/var/www/armycreator"
VOLUME="$(pwd)/../armycreator-website:$WORKING_DIR"

function composer() {
    # docker run -v "$VOLUME" -w $WORKING_DIR --rm composer:latest composer $1
    docker-compose exec php5 php /usr/local/bin/composer $*
}

function symfony() {
    docker-compose exec php5 php app/console $*
}

function bower() {
    docker run -v "$VOLUME" -w $WORKING_DIR --rm node:6 "./node_modules/.bin/bower $*"
}

function npm() {
    docker run -v "$VOLUME" -w $WORKING_DIR --rm node:6 npm $*
}

function init() {
    composer install
    # docker run -v "$VOLUME" -w $WORKING_DIR --rm composer:latest install
    npm install
    bower install
    symfony doctrine:migrations:migrate  --no-interaction
    # docker-compose exec php5 php app/console doctrine:migrations:migrate 
}

COMMAND=$1
shift

if [ $COMMAND = "init" ]
then
    init
elif [ $COMMAND = "composer" ]
then
    composer $*
elif [ $COMMAND = "sf" ]
then
    symfony $*
elif [ $COMMAND = "npm" ]
then
    symfony $*
elif [ $COMMAND = "bower" ]
then
    symfony $*
fi
