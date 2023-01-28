#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ------------------------------------------------------------------------ \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Java ] ------------------------------------------------------------------------------ \033[0m"
sudo apt install openjdk-11-jre -y > /dev/null 2>&1
echo -e "\033[1;32m- [ DOWNLOADING Jenkins ] -------------------------------------------------------------------------- \033[0m"
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Jenkins ] --------------------------------------------------------------------------- \033[0m"
sudo apt install jenkins -y > /dev/null 2>&1
echo -e "\033[1;32m- [ STARTING Jenkins ] ----------------------------------------------------------------------------- \033[0m"
sudo systemctl start jenkins
sudo systemctl daemon-reload

# Install Docker, Containerd and Docker compose
sudo apt update > /dev/null 2>&1
sudo apt install ca-certificates curl gnupg lsb-release -y > /dev/null 2>&1
sudo mkdir -p /etc/apt/keyrings
echo -e "\033[1;32m- [ DOWNLOADING Docker| Docker Compose | Containerd ] ---------------------------------------------- \033[0m"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Docker | Docker Compose | Containerd ] ---------------------------------------------- \033[0m"
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y > /dev/null 2>&1
echo -e "\033[1;32m- [ STARTING Docker ] ------------------------------------------------------------------------------ \033[0m"
sudo systemctl start docker > /dev/null 2>&1
sudo systemctl enable docker > /dev/null 2>&1
sudo systemctl daemon-reload
sudo sh -c 'usermod -aG docker jenkins'
sudo systemctl restart jenkins

# Show default password admin jenkins
echo -e "\033[1;33m- [ Password Default Jenkins ] --------------------------------------------------------------------- \033[0m"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo -e "\033[1;32m- [ Successfully ] --------------------------------------------------------------------------------- \033[0m"
