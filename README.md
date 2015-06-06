xtradb
=============
A containerized [Percona XTraDB](https://www.percona.com/software/percona-server/percona-xtradb)


## Usage

```
# Run XTraDB
docker run -it --name xtradb -e MYSQL_ROOT_PASSWORD=XXXX usman/xtradb 

# You will be in an interactive prompt
# modify / create /etc/my.cnf 
/etc/init.d/mysql bootstrap-pxc
# run setup sql
mysql -u root < /tmp/mysql-setup.sql
```
## Environment Variables

When you start the xtradb image, you can adjust the configuration of the MySQL instance by passing one or more environment variables on the docker run command line. Do note that none of the variables below will have any effect if you start the container with a data directory that already contains a database: any pre-existing database will always be left untouched on container startup.

`MYSQL_ROOT_PASSWORD`

This variable is mandatory and specifies the password that will be set for the MySQL root superuser account. In the above example, it was set to my-secret-pw.

`MYSQL_DATABASE`

This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted superuser access (corresponding to GRANT ALL) to this database.

`MYSQL_USER, MYSQL_PASSWORD`

These variables are optional, used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions (see above) for the database specified by the `MYSQL_DATABASE` variable. Both variables are required for a user to be created.

Do note that there is no need to use this mechanism to create the root superuser, that user gets created by default with the password specified by the `MYSQL_ROOT_PASSWORD` variable.

`MYSQL_ALLOW_EMPTY_PASSWORD`

This is an optional variable. Set to yes to allow the container to be started with a blank password for the root user. NOTE: Setting this variable to yes is not recommended unless you really know what you are doing, since this will leave your MySQL instance completely unprotected, allowing anyone to gain complete superuser access.

## Building

To build the image, simply invoke

    docker build -t xtradb github.com/techtraits/xtradb 

A prebuilt container is also available in the docker index

    docker pull usman/xtradb
    
## Author

  * Usman Ismail (<usman@techtraits.com>)

## LICENSE

Copyright 2014 Usman Ismail

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
