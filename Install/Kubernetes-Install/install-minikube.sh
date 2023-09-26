#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ---------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ DOWNLOADING Docker ] ------------------------------------------------------------------------------- \033[0m"
sudo apt install ca-certificates curl gnupg lsb-release -y > /dev/null 2>&1
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null 2>&1
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Docker  ] ------------------------------------------------------------------------------- \033[0m"
sudo apt install docker-ce -y > /dev/null 2>&1
echo -e "\033[1;32m- [ STARTING Docker ] ---------------------------------------------------------------------------------- \033[0m"
sudo systemctl start docker
sudo systemctl enable docker > /dev/null 2>&1
sudo systemctl daemon-reload

echo -e "\033[1;32m- [ INSTALLING Minikube ] ------------------------------------------------------------------------------ \033[0m"
sudo snap install kubectl --classic > /dev/null 2>&1
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null 2>&1
sudo install minikube-linux-amd64 /usr/local/bin/minikube > /dev/null 2>&1
echo "Execute: exit"
sudo sh -c 'usermod -aG docker $USER && newgrp docker'
minikube start
sudo rm minikube*
echo -e "\033[1;32m- [ Successfully ] ------------------------------------------------------------------------------------- \033[0m"

# OPCIONAL
# echo -e "\033[1;32m- [ INSTALLING Kubectx | Kubens ] ---------------------------------------------------------------------- \033[0m"
# sudo git clone https://github.com/ahmetb/kubectx  /opt/kubectx > /dev/null 2>&1
# sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
# sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
