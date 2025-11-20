#!/bin/bash

sudo sed -i '$ a export DB_HOST=mongodb://54.75.59.107:27017/posts' ~/.bashrc

sudo source ~/.bashrc

sudo node ~/se-test-app/nodejs20-se-test-app-2025/app/seeds/seed.js

pm2 kill
pm2 start ~/se-test-app/nodejs20-se-test-app-2025/app/app.js

