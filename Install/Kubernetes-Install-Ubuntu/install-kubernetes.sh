#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ---------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Kubernetes ] ---------------------------------------------------------------------------- \033[0m"
sudo snap install kubectl --classic > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Minikube ] ------------------------------------------------------------------------------ \033[0m"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null 2>&1
sudo install minikube-linux-amd64 /usr/local/bin/minikube > /dev/null 2>&1
sudo sh -c 'usermod -aG docker $USER && newgrp docker'
minikube start --driver=docker > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Utilitários ] --------------------------------------------------------------------------- \033[0m"
sudo apt install unzip telnet net-tools -y > /dev/null 2>&1
sudo sh -c "echo alias k=kubectl >> /etc/profile"
echo -e "\033[1;32m- [ INSTALLING Kubectx | Kubens ] ---------------------------------------------------------------------- \033[0m"
sudo git clone https://github.com/ahmetb/kubectx  /opt/kubectx > /dev/null 2>&1
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
echo -e "\033[1;32m- [ INSTALLING Bash-completion ] ----------------------------------------------------------------------- \033[0m"
sudo apt install bash-completion -y > /dev/null 2>&1
sudo echo 'source <(kubectl completion bash)' >> ~/.bashrc
sudo sh -c 'kubectl completion bash > /etc/bash_completion.d/kubectl'
sudo echo 'complete -F __start_kubectl k' >> ~/.bashrc
echo -e "\033[1;32m- [ Successfully ] ------------------------------------------------------------------------------------- \033[0m"
