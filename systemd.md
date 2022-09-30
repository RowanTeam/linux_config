### 1. Find python runtime path
    which python
This will return something like this /usr/bin/python3, use this as <PYTHON_PATH>

### 2. Create a service
    sudo systemctl --force --full edit <SERVICE_NAME>.service
    
### 3.paste
    [Unit]
    Description=<(Optional) Description of your project>
    After=network.target

    [Service]
    ExecStart=<PYTHON_PATH> <PATH_TO_SCRIPT>.py

    [Install]
    WantedBy=multi-user.target
Save it

### 4. reload all Systemd services
    sudo systemctl daemon-reload

### 5. Enable autostart on boot of your new service
    sudo systemctl enable <SERVICE_NAME>.service
