#!/bin/bash

# Update local package
sudo apt update
sudo apt upgrade

# Install Nginx server
sudo apt install nginx

# Install CURL
sudo apt install -y curl

# Setup Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# Install Node.js 18
sudo apt install -y nodejs

# Check Node Version
node --version

# Install PM2 Package Manager globally to serve Node.js application
sudo npm install -g pm2