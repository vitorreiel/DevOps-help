[ Configuração para adicionar um novo User e ainda remover o Root do SSH ]

adduser nome_user
usermod -aG sudo nome_user
Como root entre no diretorio do usuario cadastrado
   - /home/nome_user/
   - mkdir .ssh
   - cd .ssh
   - cp ../../../root/.ssh/authorized_keys .
   - chown nome_user:nome_user authorized_keys
Remover root como ssh
   - sudo nano /etc/ssh/sshd_config
   - Procure a linha 'PermitRootLogin yes' para 'PermitRootLogin no'
   - salve
   - service ssh restart
