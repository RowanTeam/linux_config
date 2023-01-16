## 1. DOWNLOAD
    sudo apt install nginx-full libnginx-mod-rtmp

## 2. CONFIG
    sudo nano /etc/nginx/nginx.conf

### CHANGE
    rtmp {
            server {
                    listen 1935;
                    chunk_size 4096;

                    application live {
                            live on;
                            record off;
                    }
            }
    }

## 3. RESTART
    service nginx start
    service nginx stop

rtmp://127.0.0.1:1935/live/1234
