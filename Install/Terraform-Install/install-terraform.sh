#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ---------------------------------------------------------------------------- \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ DOWNLOADING Terraform ] --------------------------------------------------------------------------- \033[0m"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null 2>&1
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
echo -e "\033[1;32m- [ INSTALLING Terraform ] ----------------------------------------------------------------------------- \033[0m"
sudo apt update && sudo apt install terraform > /dev/null 2>&1
echo -e "\033[1;32m- [ Successfully ] ---------------------------------------------------------------------------------- \033[0m"


