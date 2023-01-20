#!/bin/bash

# Install Sonarqube and JDK
sudo apt install wget unzip default-jdk -y
sudo wget -O sonarqube https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.8.0.63668.zip
sudo unzip sonarqube-9.8.0.63668.zip -d /opt/
sudo mv /opt/sonarqube-9.8.0.63668 /opt/sonarqube
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube
sudo touch /etc/systemd/system/sonar.service
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
sudo service start sonar.service

# Install Sonar Scanner
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
sudo mv /opt/sonar-scanner-cli-4.7.0.2747-linux /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner
PATH=$PATH:/opt/sonar-scanner/bin
# echo /etc/environment
# If S.O (CentOS or RedHat)
#echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
