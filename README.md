# docker-yafradb
Yafra Docker DB Images

Supported databases:
 * Mysql
 * Postgres (soon)
 * Oracle (without docker support)
 * Derby (only for java)
 * MongoDB
 
The default is Mysql.

All database come with a default setup like tables, users, schemas, ... for yafra.org examples. To persist data use the dataonly container.

## Prerequisites
### get docker images
pull all with:
```bash
docker pull yafraorg/docker-yafradb
docker pull yafraorg/docker-yafradb:mysql
docker pull yafraorg/docker-yafradb:postgress
docker pull yafraorg/docker-yafradb:mongodb
docker pull yafraorg/docker-yafradb:dataonly
```

### start the dataonly container
start the dataonly container 1st time:
```bash
docker run -d --name yafradata yafraorg/docker-yafradb:dataonly
```
assigning a name to the dataonly image is needed for further reference. You don't need to stop or start it from now on as it is registered with the right name. As it is data only and no processes are running, it is just data only. You can back it up as needed. Be aware that if you remove the image you loose all data!

## run interactive
mysql:
```bash
docker run --rm -t -p 3306:3306 --name yaframysql --volumes-from yafradata -i yafraorg/docker-yafradb:mysql /bin/bash
sudo service mysql start
```

mongodb:
```bash
docker run --rm -t -p 27017:27017 --name yaframongo --volumes-from yafradata -i yafraorg/docker-yafradb:mongodb /bin/bash
```

## run production
```bash
docker run -d -p 3306:3306 --name yaframysql --volumes-from yafradata yafraorg/docker-yafradb:mysql
docker run -d -p 27017:27017 --name yaframongo --volumes-from yafradata yafraorg/docker-yafradb:mongodb
```

## start/stop/remove docker
you can start / stop a docker container like any other program. If you want to remove it as runnable image use the "rm" option, careful that will reset the image.
```bash
docker ps
docker start yaframysql
docker stop yaframysql
docker rm yaframysql
```

## link you docker with a database
In order to link an application docker with a database docker use the following docker syntax:
```bash
docker run some_args [--volumes-from yafradata] --link yaframongo:db --name yafraexample yafraorg/docker-xxx your_cmd
```
The --link will link it to the respective database container (in this example the mongodb). You can again use the data only image to persist data on your application container if needed - this is not needed for the db link, only for docker you will run! The db link has already the volumes-from if you started as described above.

## Base application image link
Please see [yafra.org base image](https://github.com/yafraorg/docker-yafrabase) for more information.
Base database for mysql: https://registry.hub.docker.com/u/dockerfile/mysql/

## Ohter information
See wiki on database: https://github.com/yafraorg/yafra/wiki/Db
Yafra database scripts: https://github.com/yafraorg/yafra-database
