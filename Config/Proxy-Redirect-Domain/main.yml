server {

# Domínios da página web
        server_name example.com www.example.com;
# Nomes de arquivo padrão de execução da tela inicial da página web
        index index.html index.htm index.nginx-debian.html;
# Configurações de log de erro
        access_log /var/log/nginx/nodeapp.log;
        error_log  /var/log/nginx/nodeapp-error.log error;

# Configuração raiz
        location / {
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header Host $http_host;
                # localhost seguido da porta na qual está configurado para rodar a aplicação
                proxy_pass http://localhost:porta;
                proxy_redirect off;
        }
}
