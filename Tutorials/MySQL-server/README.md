# Instalação
apt install mysql-server
# Comentar as linhas bind-address e mysqlx-bind-address
nano /etc/mysql/mysql.conf.d/mysqld.cnf
# Restartar o serviço
service mysql restart

[Funcionamento]
mysql
CREATE DATABASE nome_database;
CREATE USER 'nome_usuario'@'%' IDENTIFIED BY mysql_native_password BY 'senha';
GRANT ALL PRIVILEGES ON nome_database.* TO 'nome_usuario'@'%';
USE nome_database;
FLUSH PRIVILEGES;

[Conexão]
mysql -u nome_usuario -p nome_database
