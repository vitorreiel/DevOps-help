#!/bin/bash
echo "Digite o número de dominíos que serão hospedados: "
read num
i=1
l=1
while [ $i -le $num ]; do
	echo "Digite o nome do domínio: "
	read array[i]
	i=$((i+1))
done
echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ---------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
sudo apt install nginx -y > /dev/null 2>&1
echo -e "\033[1;32m- [ RUNNING Nginx ] ------------------------------------------------------------------------------------- \033[0m"
sudo systemctl start nginx
echo -e "\033[1;32m- [ ENABLE Nginx.service ] ------------------------------------------------------------------------------ \033[0m"
sudo systemctl enable nginx
while [ $i -ge $l ]; do
	sudo mkdir /var/www/${array[i]} > /dev/null 2>&1
echo "server {
	listen 80;
	listen [::]:80;

	root /var/www/${array[i]};
	index index.html index.htm index.nginx-debian.html;

	server_name ${array[i]}.com www.${array[i]}.com;

	location / {
		try_files $uri $uri/ =404;
	}
}" | tee -a ${array[i]} > /dev/null 2>&1
	sudo mv ${array[i]} /etc/nginx/sites-available/ > /dev/null 2>&1
	sudo ln -s /etc/nginx/sites-available/${array[i]} /etc/nginx/sites-enabled/ > /dev/null 2>&1
	i=$((i-1))
done
sudo rm /etc/nginx/sites-enabled/sites-available > /dev/null 2>&1
sudo unlink /etc/nginx/sites-enabled/default > /dev/null 2>&1
echo -e "\033[1;32m- [ Domains Successfully Created ] ---------------------------------------------------------------------- \033[0m"
