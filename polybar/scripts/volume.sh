#! /bin/bash

# Customize output
icon_color="#FF5555"
text_color="#FFFFFF"
mute_icon=" "
volumeoff_icon=" "
volumemid_icon=" "
volumehigh_icon=" "

# Get audio information
volume=$(pactl list sinks | grep -A 15 'Sink #0' | grep 'Volume:' | awk -F / '{print $2}' | head -n 1 | sed 's/[^0-9]*//g')
mute=$(pactl list sinks | grep -A 15 'Sink #0' | grep 'Mute:' | awk '{print $2}')

# Select the matching icon
if [[ $mute == "yes" ]]; then
    icon=$mute_icon
elif [[ $volume == 0 ]]; then
    icon=$volumeoff_icon
elif [[ $volume -lt 75 ]]; then
    icon=$volumemid_icon
else
    icon=$volumehigh_icon
fi

# Format the output
output="%{F$icon_color}$icon%{F$text_color}$(printf "%3s" "$volume")%%{F-}"
echo "$output"
