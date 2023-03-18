## change permission
    sudo chmod 646 /sys/class/backlight/intel_backlight/brightness

## change brightness
    sudo echo {desired value: 500} > /sys/class/backlight/intel_backlight/brightness
10 < desired value < max_brightness (-10)

## command to key shortcut
