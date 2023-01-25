#!/bin/bash

echo -e "\033[1;32m- [ CHECKOUT Atualizações ] ------------------------------------------------------------------------ \033[0m"
sudo apt update > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Java ] ------------------------------------------------------------------------------ \033[0m"
sudo apt install openjdk-11-jre unzip -y > /dev/null 2>&1
echo -e "\033[1;32m- [ INSTALLING Sonarqube ] ------------------------------------------------------------------------- \033[0m"
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.8.0.63668.zip > /dev/null 2>&1
sudo unzip sonarqube-9.8.0.63668.zip -d /opt/ > /dev/null 2>&1
sudo mv /opt/sonarqube-9.8.0.63668 /opt/sonarqube
echo -e "\033[1;32m- [ CREATE User 'sonar' ] -------------------------------------------------------------------------- \033[0m"
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube
echo -e "\033[1;32m- [ CREATE sonar.service ] ------------------------------------------------------------------------- \033[0m"
DIR=/etc/systemd/system/sonar.service
if [ -e "$DIR" ]; then
sudo systemctl start sonar.service
else
echo "[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
ExecReload=/opt/sonarqube/bin/linux-x86-64/sonar.sh restart
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target" | tee -a sonar.service > /dev/null 2>&1
sudo mv sonar.service /etc/systemd/system/
sudo systemctl start sonar.service
fi
echo -e "\033[1;32m- [ STARTING sonar.service ] ----------------------------------------------------------------------- \033[0m"

# Install Sonar Scanner
echo -e "\033[1;32m- [ INSTALLING Sonar-scanner ] --------------------------------------------------------------------- \033[0m"
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip > /dev/null 2>&1
sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/ > /dev/null 2>&1
sudo mv /opt/sonar-scanner-4.7.0.2747-linux /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner
sudo rm sonar*
echo -e "\033[1;32m- [ Successfully Install Sonarqube | Sonar-Scanner ] ----------------------------------------------- \033[0m"
echo -e "\033[1;33m- [ EXECUTE 'PATH=\$PATH:/opt/sonar-scanner/bin' ] -------------------------------------------------- \033[0m"
# echo /etc/environment
# If S.O (CentOS or RedHat)
#echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
