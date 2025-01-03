#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT ] ---------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Docker  ] ------------------------------------------------------------------------------- \033[0m"
curl -fsSL https://get.docker.com | bash

echo -e "\033[1;32m- [ INSTALLING Minikube ] ------------------------------------------------------------------------------ \033[0m"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null 2>&1
sudo install minikube-linux-amd64 /usr/local/bin/minikube > /dev/null 2>&1
sudo usermod -aG docker $USER && newgrp docker

echo -e "\033[1;32m- [ EXECUTE: minikube start ] ------------------------------------------------------------------------------------- \033[0m"

# OPCIONAL
# echo -e "\033[1;32m- [ INSTALLING Kubectx | Kubens ] ---------------------------------------------------------------------- \033[0m"
# sudo git clone https://github.com/ahmetb/kubectx  /opt/kubectx > /dev/null 2>&1
# sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
# sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
