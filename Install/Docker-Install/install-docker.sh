#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ DOWNLOADING Docker | Docker Compose | Containerd ] ---------------------------------------------- \033[0m"
sudo apt install ca-certificates curl gnupg lsb-release -y > /dev/null 2>&1
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null 2>&1
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Docker | Docker Compose | Containerd ] ----------------------------------------------- \033[0m"
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y > /dev/null 2>&1
echo -e "\033[1;32m- [ STARTING Docker ] ------------------------------------------------------------------------------- \033[0m"
sudo systemctl start docker
sudo systemctl enable docker > /dev/null 2>&1
sudo systemctl daemon-reload
echo -e "\033[1;32m- [ Successfully ] ---------------------------------------------------------------------------------- \033[0m"
