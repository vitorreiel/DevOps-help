#!/bin/bash
echo "Digite o número de dominíos que serão hospedados: "
read num
i=1
l=1
while [ $i -le $num ]; then
	echo "Digite o nome do domínio: "
	read ${array[i]}
	i+=1
done
sudo apt udpate
sudo apt install nginx
while [ $i -ge $l ]; then
sudo touch /var/www/${array[i]}
cat <<EOF>> /etc/nginx/sites-available/${array[i]}
server {
        listen 80;
        listen [::]:80;

        root /var/www/${array[i]};
        index index.html index.htm index.nginx-debian.html;

        server_name ${array[i]}.com www.${array[i]}.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
EOF
sudo ln -s /etc/nginx/sites-available/${array[i]} /etc/nginx/sites-enabled/
done
sudo unlink /etc/nginx/sites-enabled/default
