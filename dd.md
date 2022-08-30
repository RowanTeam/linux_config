# SD IMG
### SEARCH TARGET
    sudo fdisk -l   #sudo lsblk -l
### UNMOUNT TARGET
    sudo umount /dev/sdb
### COPY
    sudo dd if=/dev/sdb of=/media/z/0/MVPC10/IMAGE/v1.1.img status=progress conv=noerror    #bs=1M
### PASTE
    sudo dd if=/media/z/0/MVPC10/IMAGE/v1.1.img of=/dev/sdb status=progress conv=noerror    #bs=1M
    
    
# BACKUP OS IMG
    http://comfilewiki.co.kr/en/doku.php?id=cupc:backup_restore:index
### COPY
    sudo sh -c "dd if=/dev/nvme0n1 status=progress | xz -c > /media/ubuntu/0/linux.img.xz"
    (sudo sh -c "dd if=/dev/sda status=progress | xz -c > /media/cupc/1708-B3F/cpcv5.img.xz")
### PASTE
    sudo sh -c "xz -d -c /media/cupc/1708-B3F/cpcv5.img.xz | dd of=/dev/sda status=progress"
    
