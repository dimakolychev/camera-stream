#!/bin/bash
set -e

sudo mkdir -p /opt/camera-stream/www

sudo cp scripts/*.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/*.sh

sudo cp www/index.html /opt/camera-stream/www/

sudo cp systemd/*.service /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl enable camera-stream-cam1
sudo systemctl enable camera-stream-cam2
sudo systemctl enable camera-stream-web

sudo systemctl restart camera-stream-cam1
sudo systemctl restart camera-stream-cam2
sudo systemctl restart camera-stream-web

echo "Done."
