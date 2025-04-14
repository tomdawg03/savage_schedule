#!/bin/bash

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install required system packages
sudo apt-get install -y python3-pip python3-venv nginx

# Create project directory
sudo mkdir -p /home/ubuntu/sav_schedule
sudo chown -R ubuntu:ubuntu /home/ubuntu/sav_schedule

# Setup backend
cd /home/ubuntu/sav_schedule/backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Setup frontend
cd /home/ubuntu/sav_schedule/frontend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Setup systemd services
sudo cp /home/ubuntu/sav_schedule/backend/savage-backend.service /etc/systemd/system/
sudo cp /home/ubuntu/sav_schedule/frontend/savage-frontend.service /etc/systemd/system/

# Reload systemd and start services
sudo systemctl daemon-reload
sudo systemctl enable savage-backend
sudo systemctl enable savage-frontend
sudo systemctl start savage-backend
sudo systemctl start savage-frontend

# Setup Nginx
sudo tee /etc/nginx/sites-available/savage-schedule << EOF
server {
    listen 80;
    server_name _;

    location /api/ {
        proxy_pass http://localhost:5001/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/savage-schedule /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo systemctl restart nginx

# Setup firewall
sudo ufw allow 80
sudo ufw allow 22
sudo ufw --force enable 