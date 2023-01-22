[ COMMANDS DOCKER ]
# build image DockerFile
docker build . -t name/name

# view all containers in execution
docker ps

# run container, select image created in 'name/name'
docker run --name name-container -p PORT:PORT -d name/name

# stop container
docker container stop name-container

# view all images
docker images

# force remove image
docker image rm --force image-id

# check logs in container
docker logs container-name

# Enter the container
docker exec -it container-id /bin/bash

[ COMMANDS DOCKER COMPOSE ]

# build
docker compose buid

# view all images
docker compose images

# view all containers
docker compose ps

[ MySQL in Docker ]

# Create volume
docker volume create mysql-volume

# Installing image 
docker run --name container-mysql -p3306:3306 -v mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=qualquer_senha -d mysql/mysql-server:latest

# Access container MySQL
docker exec -it container-mysql bash

# Console MySQL, insert password
mysql -u root -p

[ COMMANDS MySQL ]

CREATE DATABASE nome_database;
CREATE USER 'nome_usuario'@'%' IDENTIFIED BY mysql_native_password BY 'senha';
GRANT ALL PRIVILEGES ON nome_database.* TO 'nome_usuario'@'%';
USE nome_database;
FLUSH PRIVILEGES;
