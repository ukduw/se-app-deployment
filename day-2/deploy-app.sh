#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo git clone https://github.com/ukduw/se-test-app.git

sudo apt install nginx -y
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"
sudo apt install nodejs -y

cd nodejs20-se-test-app-2025/app

sudo npm install
npm start app.js    # runs in foreground

