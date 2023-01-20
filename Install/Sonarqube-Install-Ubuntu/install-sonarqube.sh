#!/bin/bash

# Install Sonarqube, Sonar-scanner, JDK, Unzip, Wget
echo -e "\033[1;32m- [ INSTALLING Java ] ------------------------------------------------------------------------------ \033[0m"
sudo apt install wget unzip default-jdk -y
echo -e "\033[1;32m- [ INSTALLING Sonarqube ] ------------------------------------------------------------------------------ \033[0m"
sudo wget -O sonarqube https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.8.0.63668.zip
sudo unzip sonarqube-9.8.0.63668.zip -d /opt/
sudo mv /opt/sonarqube-9.8.0.63668 /opt/sonarqube
echo -e "\033[1;32m- [ CREATE User 'sonar' ] ------------------------------------------------------------------------------ \033[0m"
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube
sudo touch /etc/systemd/system/sonar.service
echo -e "\033[1;32m- [ CREATE sonar.service ] ------------------------------------------------------------------------------ \033[0m"
sudo cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
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
WantedBy=multi-user.target
EOT
echo -e "\033[1;32m- [ STARTING sonar.service ] ------------------------------------------------------------------------------ \033[0m"
sudo service start sonar.service

# Install Sonar Scanner
echo -e "\033[1;32m- [ INSTALLING Sonar-scanner ] ------------------------------------------------------------------------------ \033[0m"
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
sudo mv /opt/sonar-scanner-cli-4.7.0.2747-linux /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner
echo -e "\033[1;32m- [ CREATE variable global 'sonar-scanner' ] ------------------------------------------------------------------------------ \033[0m"
PATH=$PATH:/opt/sonar-scanner/bin
echo -e "\033[1;32m- [ Successfully Install Sonarqube and Sonar-Scanner ] ---------------------------------------------------------------- \033[0m"
# echo /etc/environment
# If S.O (CentOS or RedHat)
#echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
