Armycreator containers
============

This repository tell us how to develop for armycreator website.

## Useful resources
Slack: [armycreator](https://armycreator.slack.com/)

[Trello board](https://trello.com/b/ybwzcEjR/armycreator)


## Dependencies
The armycreator website is managed by docker to avoid the complexity of installing a lots of dependencies.
The only one (well two) you need is [docker and docker-compose](https://docs.docker.com/compose/install/)

## Installation

* Clone this repository in a directory (like `~/code/armycreator-containers`)
* Clone armycreator website repository in the same root directory (`~/code` in our example) and name it `armycreator-website` (it should be in `~/code/armycreator-website`)
* In the armycreator-containers folder, execute:
  * `docker-compose build`
  * `docker-compose up`
  * `./build.sh init`

## Launch website
Open `http://localhost:81`.

You should see the armycreator homepage.

Connect to site with user and password: `admin` / `admin`

## Want to access the API ?
The domain name will be `http://api.127.0.0.1.xip.io` and `http://oauth2.127.0.0.1.xip.io`

More documentation to come...


## Troubleshooting
### Accessing MySQL
If you want to access MySQL from your machine (with a software for exemple), just look in the `docker-compose.yml` file.

### Port issues
The http server and MySQL needs to have a opened port to access them.

#### Port conflict is taken
The http server uses the port number `81`.
If you need to use another port, you can just run docker compose like this: `HTTP_PORT=82 docker-compose up`.


### mysql permission denied
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
