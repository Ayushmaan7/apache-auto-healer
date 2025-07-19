#!/bin/bash
if ! pgrep httpd > /dev/null; then
    echo "$(date) - Apache restarted" >> /home/ec2-user/health.log
    systemctl restart httpd
fi
