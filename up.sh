docker-compose exec php5 /usr/local/bin/composer install
docker-compose exec php5 npm install
docker-compose exec php5 bower install --allow-root
docker-compose exec php5 php app/console doctrine:migrations:migrate
