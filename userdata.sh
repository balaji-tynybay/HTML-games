#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/jakesgordon/javascript-tetris.git
sudo cp -R javascript-tetris/* /var/www/html
sudo systemctl restart nginx