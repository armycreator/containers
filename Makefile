all:
	docker run -v "`pwd`/../armycreator-website:/var/www/armycreator" -w "/var/www/armycreator" --rm composer composer install
	docker run -v "`pwd`/../armycreator-website:/var/www/armycreator" -w "/var/www/armycreator" --rm node:6 npm install
	docker run -v "`pwd`/../armycreator-website:/var/www/armycreator" -w "/var/www/armycreator" --rm node:6 "./node_modules/.bin/bower install"
	docker-compose exec php5 php app/console doctrine:migrations:migrate
