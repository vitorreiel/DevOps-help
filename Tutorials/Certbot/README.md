# Instalação Certbot
sudo apt install certbot python3-certbot-nginx

# Remover Certbot
sudo apt remove certbot

# Configuração SSL Certficado Autoassinado
sudo certbot --nginx -d example.com -d www.example.com

# Criação de Serviço para renovar automaticamente a Certificação
sudo systemctl start snap.certbot.renew.service

# Teste de renovação, para ter certeza que a configuração foi efetiva
sudo certbot renew --dry-run
