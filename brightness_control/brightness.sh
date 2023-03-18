#!/bin/bash

# To remove sudo requirement, add this to /etc/udev/rules.d/backlight.rules

# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chgrp wheel /sys/class/backlight/%k/brightness"
# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"

# Usage:
# sudo bash brightness.sh 200 == increment by 200
# sudo bash brightness.sh -200 == decrement by 200

# Just bind this to your brightness keys

old=`cat /sys/class/backlight/intel_backlight/brightness`
max=`cat /sys/class/backlight/intel_backlight/max_brightness`
new=`expr $old + $1`

# make sure not to go below 0
if [ $new -lt 10 ]
then
	new=0
fi

# make sure not to go over the maximum brightness
if [ $new -gt $max ]
then
	new=$max
fi

echo $new | tee /sys/class/backlight/intel_backlight/brightness

