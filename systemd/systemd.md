### 1. Find python runtime path
    which python
This will return something like this /usr/bin/python3, use this as <PYTHON_PATH>

### 2. Create a service
    srvc="<NAME>.service"
    
    cd /etc/systemd/system
    sudo nano $srvc
#sudo systemctl --force --full edit <SERVICE_NAME>.service
(alterative)
    
### 3. paste
    [Unit]
    Description=<(Optional) Description of your project>
    After=network.target

    [Service]
    WorkingDirectory=/home/pi/gappi
    ExecStart=<PYTHON_PATH> <PATH_TO_SCRIPT>.py
    Restart=on-failure
    RestartSec=1s
    
    [Install]
    WantedBy=multi-user.target
<PYTHON_PATH> = /usr/bin/env python3

### 4. reload all Systemd services
    sudo systemctl daemon-reload
    sudo systemctl enable $srvc
    sudo systemctl restart $srvc
    sudo systemctl status $srvc

### 5. REMOVE
    srvc="<NAME>.service"
    
    sudo systemctl stop $srvc
    sudo systemctl disable $srvc
    sudo rm /etc/systemd/system/$srvc
    sudo rm /usr/lib/systemd/system/$srvc
    sudo systemctl daemon-reload
    sudo systemctl reset-failed

### SYSTEMD COMMANDS
##### Stop
    sudo systemctl stop $srvc
##### DISABLE AUTOSTART
    sudo systemctl disable $srvc
##### REMOVE SERVICE
    sudo systemctl revert $srvc

##### see full staus & log    
    sudo journalctl -u $srvc
##### remove all logs
    sudo journalctl --rotate --vacuum-time=1s
