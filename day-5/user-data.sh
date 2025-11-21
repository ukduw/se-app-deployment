#!/bin/bash

sleep 15    # since user data script runs immediately on spin up

cd /home/ubuntu/se-test-app/nodejs20-se-test-app-2025/app

pm2 start app.js

