#!/bin/bash

sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Nvm ] ------------------------------------------------------------------------------ \033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash > /dev/null 2>&1
source ~/.bashrc
echo -e "\033[1;33m- [ SELECT Node.js Version {Example: v14.10.0} ] -------------------------------------------------- \033[0m"
read versaoNode
echo -e "\033[1;32m- [ INSTALLING Node.js Version: $versaoNode ] -------------------------------------------------------- \033[>source ~/.nvm/nvm.sh
nvm install $versaoNode
nvm use $versaoNode
node --version
echo -e "\033[1;32m- [ INSTALLING Npm ] ------------------------------------------------------------------------------ \033[0m"
sudo apt install npm -y > /dev/null 2>&1
echo -e "\033[1;32m- [ Successfully Install Node.js ] ---------------------------------------------------------------- \033[0m"
# [Show all versions Node.js]
# nvm list-remote

# [Install specific version Node.js]
# nvm install v14.10.0
