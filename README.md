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
    
