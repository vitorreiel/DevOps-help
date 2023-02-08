# Instalação do Nginx (Servidor Web)
sudo apt update
sudo apt install nginx

# Caso esteja utilizando o Firewall UFW
sudo ufw allow 'Nginx HTTP' # Libera o acesso do Nginx na porta 80
sudo ufw allow 'Nginx HTTPS' # Libera o acesso do Nginx na porta 443 (TLS/SSL)
sudo ufw allow 'Nginx FULL' # Libera os acessos do Nginx nas portas 80 e 443

# Local da configuração onde sua aplicação
sudo nano /etc/nginx/sites-available/your_domain

# Configuração default do diretorio /etc/nginx/sites-available/...
server {
        listen 80;
        listen [::]:80;

        root /var/www/your_domain/html;
        index index.html index.htm index.nginx-debian.html;

        server_name your_domain www.your_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}

# Criação do link para o /sites-enabled/ que irá aplicar as configurações feitas no /sites-available/
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/

# Para remover a página do Nginx como padrão
sudo unlink /etc/nginx/sites-enabled/default

# Verificação de algum possível erro de configuração
sudo nginx -t

# Inicialização do serviço Nginx, Reiniciação do serviço e Imterrompimento do serviço
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl stop nginx
