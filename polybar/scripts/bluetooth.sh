#! /bin/bash

# Customize the output
icon_color="#FF5555"
text_color="#FFFFFF"
icon=" "

# Determining the output text
stat=$(systemctl status bluetooth.service | grep "Active:" | awk '{print $2}')
if [[ $stat == "active" ]]; then
    text="On"
else
    text="Off"
fi

# Format the output
output="%{F$icon_color}$icon%{F$text_color}$text%{F-}"
echo "$output"

