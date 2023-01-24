#!/bin/bash
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Kubernetes ] ------------------------------------------------------------------------------ \033[0m"
sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/kubernetes.gpg > /dev/null 2>&1
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list > /dev/null 2>&1
sudo apt install kubeadm kubelet kubectl kubectx telnet net-tools -y > /dev/null 2>&1
sudo echo "alias k=kubectl" >> /etc/profile
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
sudo apt install bash-completion -y > /dev/null 2>&1
sudo echo 'source <(kubectl completion bash)' >> ~/.bashrc
sudo kubectl completion bash > /etc/bash_completion.d/kubectl
sudo echo 'complete -F __start_kubectl k' >> ~/.bashrc

