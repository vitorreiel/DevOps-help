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

echo -e "\033[1;32m- [ INSTALLING Kubernetes ] ---------------------------------------------------------------------------- \033[0m"
sudo snap install kubectl --classic > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Minikube ] ------------------------------------------------------------------------------ \033[0m"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null 2>&1
sudo install minikube-linux-amd64 /usr/local/bin/minikube > /dev/null 2>&1
sudo sh -c 'usermod -aG docker $USER && newgrp docker'
minikube start --driver=docker > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Utilitários ] --------------------------------------------------------------------------- \033[0m"
sudo apt install unzip telnet net-tools -y > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Kubectx | Kubens ] ---------------------------------------------------------------------- \033[0m"
sudo git clone https://github.com/ahmetb/kubectx  /opt/kubectx > /dev/null 2>&1
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
echo -e "\033[1;32m- [ INSTALLING Bash-completion ] ----------------------------------------------------------------------- \033[0m"
sudo apt install bash-completion -y > /dev/null 2>&1
sudo echo 'source <(kubectl completion bash)' >> ~/.bashrc
sudo sh -c 'kubectl completion bash > /etc/bash_completion.d/kubectl'
sudo echo 'complete -F __start_kubectl k' >> ~/.bashrc
echo "alias k='kubectl'
alias kc='k config view --minify | grep name'
alias kdp='kubectl describe pod'
alias c='clear'
alias kd='kubectl describe pod'
alias ke='kubectl explain'
alias kf='kubectl create -f'
alias kg='kubectl get pods --show-labels'
alias kr='kubectl replace -f'
alias ks='kubectl get namespaces'
alias l='ls -lrt'
alias kga='k get pod --all-namespaces'
alias kgaa='kubectl get all --show-labels'" | tee -a ~/.bash_aliases > /dev/null 2>&1
source ~/.bash_aliases
echo -e "\033[1;32m- [ Successfully ] ------------------------------------------------------------------------------------- \033[0m"
