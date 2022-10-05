### 1. Find python runtime path
    which python
This will return something like this /usr/bin/python3, use this as <PYTHON_PATH>

### 2. Create a service
    cd /etc/systemd/system
    sudo nano <SERVICE_NAME>
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

#### 5. Enable autostart on boot of your new service
    sudo systemctl enable <SERVICE_NAME>.service
##### 6. RESTART
    sudo systemctl restart <SERVICE_NAME>.service
##### 7. STATUS
    sudo systemctl status <SERVICE_NAME>.service

### SYSTEMD COMMANDS
##### Stop
    sudo systemctl stop <SERVICE_NAME>.service
##### DISABLE AUTOSTART
    sudo systemctl disable <SERVICE_NAME>.service
##### REMOVE SERVICE
    sudo systemctl revert <SERVICE_NAME>.service

##### see full staus & log    
    sudo journalctl -u <service_name>.service
##### remove all logs
    sudo journalctl --rotate --vacuum-time=1s
