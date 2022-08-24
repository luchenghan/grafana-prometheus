#!/bin/bash
# For ubuntu and debian
sudo apt-get install -y adduser libfontconfig1

if [ ! -f "grafana-enterprise_9.0.6_amd64.deb" ]; then
    echo "grafana-enterprise_9.0.6_amd64.deb not exist"
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise_9.0.6_amd64.deb
fi

sudo dpkg -i grafana-enterprise_*_amd64.deb

sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server