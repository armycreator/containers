Armycreator containers
============

* Clone this repository in a directory (like `~/code/armycreator-containers`)
* Clone armycreator main repository in the same root directory (`~/code` in our example) and name it `armycreator` (it should be in `~/code/armycreator`)
* In the armycreator-containers folder, execute:
  * docker-composer build
  * docker-composer up
  * docker-composer exec db php app/console doctrine:migrations:migrate
