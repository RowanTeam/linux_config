## 1. DOWNLOAD
    sudo apt install vsftpd

#### CONFIG FIREWALL (OPTIONAL)
    sudo ufw allow 20/tcp
    sudo ufw allow 21/tcp
    sudo ufw allow 990/tcp
    sudo ufw allow 5000:10000/tcp
#### ADD USER (OPTIONAL)
    sudo adduser {USER_NAME}
    
## 2. CONFIG FTP
    sudo gedit /etc/vsftpd.conf
### uncomment followings
    anonymous_enable=NO
    local_enable=YES
    write_enable=YES
### add followings    
    pasv_min_port=5000
    pasv_max_port=10000
    
    local_root=/ftp 

