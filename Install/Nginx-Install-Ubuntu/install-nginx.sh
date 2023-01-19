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
sudo apt update
sudo apt install nginx -y > /dev/null 2>&1
sudo systemctl start nginx
sudo systemctl enable nginx
while [ $i -ge $l ]; do
	sudo mkdir /var/www/${array[i]}
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
	sudo mv ${array[i]} /etc/nginx/sites-available/
	sudo ln -s /etc/nginx/sites-available/${array[i]} /etc/nginx/sites-enabled/
	sudo rm /etc/nginx/sites-enabled/sites-available
	i=$((i-1))
done
sudo unlink /etc/nginx/sites-enabled/default
