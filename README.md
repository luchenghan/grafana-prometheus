# Prometheus

# Systemd setting

### Make directory for storage local file & config file
```
mkdir /var/lib/prometheus/data /etc/prometheus
```
### Change data permission
```
chmod -R 777 /var/lib/prometheus/data
```
### Move binary file
```
mv ./prometheus /usr/local/bin  
```
### Move config file
```
mv ./prometheus.yml /etc/prometheus/
```
### Add user group
```
groupadd prometheus
useradd -g prometheus -d /var/lib/prometheus -s /sbin/nologin prometheus
```
### Wirte systemd file
prometheus.services
```
[Unit]
Description=prometheus
After=network.target
[Service]
Type=simple
User=prometheus
ExecStart=/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus/data
Restart=on-failure
[Install]
WantedBy=multi-user.target
```
### Copy to systemd directory
```
cp ./prometheus.service /usr/lib/systemd/system/
```

### Start
```
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
```