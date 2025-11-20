#!/bin/bash

echo "DB_HOST=mongodb://34.253.125.77.107:27017/posts" >> /etc/environment
    # global env var
export DB_HOST=mongodb://34.253.125.77.107:27017/posts
    # reloads env for shell

cd /home/ubuntu/se-test-app/nodejs20-se-test-app-2025/app

node seeds/seed.js

pm2 kill
pm2 start app.js



# no need for sudo; user data runs as root
# user data starts in /
# .bashrc for env var's doesn't work