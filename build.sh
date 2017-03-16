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

function node() {
    docker run -v "$VOLUME" -w $WORKING_DIR --rm node:6 $*
}

function bower() {
    node "./node_modules/.bin/bower $*"
}

function npm() {
    node npm $*
}

function gassetic() {
    node "./node_modules/.bin/gassetic $*"
}

function initCache() {
    docker-compose exec php5 chmod -R 777 app/cache
    docker-compose exec php5 chmod -R 777 app/logs
    docker-compose exec php5 chmod -R 777 web/forum/cache
}

function init() {
    composer install

    initCache
    # docker run -v "$VOLUME" -w $WORKING_DIR --rm composer:latest install
    npm install
    bower install
    gassetic build
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
    npm $*
elif [ $COMMAND = "gassetic" ]
then
    gassetic $*
elif [ $COMMAND = "bower" ]
then
    bower $*
fi
