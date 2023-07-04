#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/nebez/floppybird.git
sudo cp -R floppybird/* /var/www/html
sudo systemctl restart nginx