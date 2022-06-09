#!/bin/bash
sudo apt-get update -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install openjdk-8-jre -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo ufw allow 8080
sudo apt update -y
sudo apt install ansible -y