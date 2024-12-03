#!/bin/bash

# Instalação do Docker
curl -fsSL https://get.docker.com | bash
sudo chmod 666 /var/run/docker.sock

# Perguntar o IP da máquina local
read -p "Digite o IP da máquina local para o Node Exporter: " IP_LOCAL

# Passo 1: Instalar o Node Exporter
echo "Baixando e instalando o Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
sudo tar xzf node_exporter-1.7.0.linux-amd64.tar.gz
sudo rm -rf node_exporter-1.7.0.linux-amd64.tar.gz
sudo mv node_exporter-1.7.0.linux-amd64 /etc/node_exporter

# Criar o serviço para o Node Exporter
echo "Configurando o serviço do Node Exporter..."
cat <<EOL | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
ExecStart=/etc/node_exporter/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Ativar o serviço
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl restart node_exporter

echo "Node Exporter instalado e em execução."

# Passo 2: Criar o arquivo docker-compose.yml
echo "Criando o arquivo docker-compose.yml..."
cat <<EOL > docker-compose.yml
services:
  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - 3000:3000
    volumes:
      - grafana_data:/var/lib/grafana
    networks:
      grafana-network:
        ipv4_address: 172.22.0.2
    restart: always

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    ports:
      - 9090:9090
    volumes:
      - prometheus_data:/etc/prometheus
      - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
    networks:
      grafana-network:
        ipv4_address: 172.22.0.3
    restart: always

networks:
  grafana-network:
    name: grafana-network
    driver: bridge
    ipam:
      config:
        - subnet: 172.22.0.0/24
          gateway: 172.22.0.1

volumes:
  grafana_data:
    name: grafana
  prometheus_data:
    name: prometheus
EOL

# Passo 3: Configurar o arquivo prometheus.yml
echo "Criando o arquivo prometheus.yml..."
mkdir -p prometheus
cat <<EOL > prometheus/prometheus.yml
global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['${IP_LOCAL}:9100']
EOL

# Passo 4: Finalizar
echo "Configuração concluída. Execute os serviços com o comando:"
echo "  docker-compose up -d"

