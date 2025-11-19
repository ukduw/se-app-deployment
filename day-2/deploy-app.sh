#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo git clone https://github.com/ukduw/se-test-app.git

sudo apt install nginx -y
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"
sudo apt install nodejs -y

cd /
cd etc/nginx/sites-available
sudo sed -i '48a\        proxy_pass http://localhost:3000;' default     # note: not idempotent; would insert a new line if run multiple times
    # could also use echo "server { ... }" > sparta_app
    # sudo ln -s /etc/nginx/sites-available/sparta_app /etc/nginx/sites-enabled/

cd /
cd ~/se-test-app/nodejs20-se-test-app-2025/app

sudo npm install
sudo npm install pm2 -g
pm2 start app.js    # runs in background

