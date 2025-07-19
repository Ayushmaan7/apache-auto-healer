#!/bin/bash
# Install Apache and crond
sudo yum install -y httpd cronie
sudo systemctl enable --now httpd
sudo systemctl enable --now crond
echo "Apache and crond services installed and started."
