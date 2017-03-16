Armycreator containers
============

# Dependencies
The armycreator website is managed by docker to avoid the complexity of installing a lots of dependencies.
The only one (well two) you need is [docker and docker-compose](https://docs.docker.com/compose/install/)

## Installation

* Clone this repository in a directory (like `~/code/armycreator-containers`)
* Clone armycreator website repository in the same root directory (`~/code` in our example) and name it `armycreator-website` (it should be in `~/code/armycreator-website`)
* In the armycreator-containers folder, execute:
  * docker-compose build
  * docker-compose up
  * make

## Launch website
Open `http://localhost:81`.

You should see the armycreator homepage.


## Troubleshooting
Having a problem like this:
```sh
db_1      | chown: cannot read directory '/var/lib/mysql/': Permission denied
apache_1  | (13)Permission denied: AH00091: apache2: could not open error log file /var/log/apache2/error.log.
apache_1  | AH00015: Unable to open logs
containers_db_1 exited with code 1
containers_apache_1 exited with code 1
```

It may be a problem with SELinux, you can read [this blog post](http://www.projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/) about it

You can do something like this:
  * `chcon -Rt svirt_sandbox_file_t /the/path/to/your/container-folder`
  * `chcon -Rt svirt_sandbox_file_t /the/path/to/your/website-folder`
