#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install git -y    # in case it's run on very lightweight linux dist that doesn't have git pre-installed - makes the script more portable
sudo git clone https://github.com/ukduw/se-test-app.git

sudo apt install nginx -y
sudo apt install sed -y     # again, usually installed by default
sudo sed -i '51c\proxy_pass http://127.0.0.1:3000;' /etc/nginx/sites-available/default
    # note: the c\ command is for "change" - replaces the whole line, not just modifying it
sudo systemctl restart nginx
sudo systemctl enable nginx
    # note: pm2 is for the app specifically; forgot to restart/enable the nginx web server itself before to reload the new nginx config...

sudo apt install curl -y    # again, usually installed by default
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"
sudo apt install nodejs -y

cd se-test-app/nodejs20-se-test-app-2025/app
sudo npm install

sudo npm install pm2 -g     # process manager for node apps
pm2 kill    # kill all node processes; fresh start + may already be running (idempotency - produce same results regardless of times run)
pm2 start app.js




# cd /
# cd etc/nginx/sites-available
# sudo sed -i '48a\        proxy_pass http://localhost:3000;' default

