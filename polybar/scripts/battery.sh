#! /bin/bash

# Customize the output
icon_color="#FF5555"
text_color="#FFFFFF"
battery0_icon=""
battery25_icon=""
battery50_icon=""
battery75_icon=""
battery100_icon=""
charging_icon="   "

capacity=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')
capacity="${capacity%%\%}"
is_charging=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

if ((capacity < 15)); then
    b_icon=$battery0_icon
elif ((capacity < 35)); then
    b_icon=$battery25_icon
elif ((capacity < 60)); then
    b_icon=$battery50_icon
elif ((capacity < 90)); then
    b_icon=$battery75_icon
else
    b_icon=$battery100_icon
fi

if [[ $is_charging != "discharging" ]]; then
    c_icon=$charging_icon
else
    c_icon="  "
fi

# Format the output
output="%{F$icon_color}$b_icon$c_icon%{F$text_color}$capacity%%{F-}"
echo "$output"
