[ Docker ]
 - cd /var/lib/jenkins/workspace/
 - Depois faça login como 'root' e execute o comando:
   - cp -r name-app /root/
   - Use 'cd' e entre no repositorio da aplicação e execute:
   - docker login localhost:8123
 - docker images
   - docker tag name-app:latest localhost:8123/name-app
   - docker push new-name-app

[ Jenkins ]
 - Painel de Controle > Gerenciar Jenkins > Configurar o Sistema
   - Sessão Propriedades globais
     - Marque Variáveis de ambiente e em seguida 'Adicionar'
     - Em 'nome' coloque: NEXUS_URL
     - Em 'valor' coloque: localhost:8123
     - Aplique e Salve as configurações
 - Painel de Controle > Gerenciar Jenkins > Credentials
   - Clique em 'System' e em seguida 'Global credentials (unrestricted)'
   - Clique em 'Add Credentials'
   - Kind 'Username with password'
   - Em 'Username' coloque o usuario criado no Nexus
   - Em 'Password' a senha do usuario do Nexus
   - Em 'ID' e 'Description' pode colocar: nexus-user
   - Clique em criar
