# Aviso: Por padrão o UFW já irá fazer parte da sua máquina, portanto não é necessário instalação
# Habilitar UFW para utilizar o protocolo IPV6 (Opcional)
sudo nano /etc/default/ufw
        "IPV6=yes"

# Comando para habilitar o firewall UFW na máquina e para desabilita-lo
sudo ufw enable
sudo ufw disable

# Comando para retornar todos os serviços que já estão com acesso ao UFW
sudo ufw status

# Para fazer a adição de alguma política de acesso a máquina com o UFW
sudo ufw allow # Seguido da porta ou nome do serviço
# Exemplo:
        # sudo ufw allow ssh ou sudo ufw allow 22 (Habilita o acesso do serviço SSH)

# Para habilitar uma sequência de portas, selecionando o protocolo TCP ou UDP
sudo ufw allow 6000:6007/tcp
sudo ufw allow 6000:6007/udp

# Habilitar o acesso a um IP específico
sudo ufw allow from 203.0.113.4

# Caso deseje especificar a porta de acesso desse ip:
sudo ufw allow from 203.0.113.4 to any port 22

# Para identificar os serviços com acesso por seu ID
sudo ufw status numbered

# Para deletar o acesso de um serviço pelo nome ou por porta
sudo ufw delete allow http ou sudo ufw delete allow 80

# Para deletar o acesso de um serviço pelo ID
sudo ufw delete Number_ID

# Para resetar todos os seus acessos e começar do zero
sudo ufw reset
