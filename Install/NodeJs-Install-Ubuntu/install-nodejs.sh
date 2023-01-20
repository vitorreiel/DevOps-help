#!/bin/bash

sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Nvm ] ------------------------------------------------------------------------------ \033[0m       --> 1;32 ""]]"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash > /dev/null 2>&1
source ~/.bashrc
echo -e "\033[1;32m- [ INSTALLING Npm ] ------------------------------------------------------------------------------ \033[0m       --> 1;32 "echo -e "\033[1;32m- [ ENABLE Nginx.service ] ------------------------------------------------------------------------------ \033[0m       --> 1;32 ""]]]]"
sudo apt install npm > /dev/null 2>&1
echo -e "\033[1;31m- [ SELECT Node.js Version {Example: v14.10.0} ] ------------------------------------------------------------------------------ \033[0m       --> 1;31 ""]]"
read versaoNode
echo -e "\033[1;32m- [ INSTALLING Node.js Version: $versaoNode ] ------------------------------------------------------------------------------ \033[0m       --> 1;32 ""]]"
nvm install $versaoNode
echo -e "\033[1;32m- [ Successfully Install Node.js ] ---------------------------------------------------------------------- \033[0m       --> 1;32 ""]]"
# [Show all versions Node.js]
# nvm list-remote

# [Install specific version Node.js]
# nvm install v14.10.0
