#! /bin/bash

# Customize the output
icon_color="#FF5555"
text_color="#FFFFFF"
wired_icon="  "
wifi_icon="  "
disconnected_icon="  "
monitormode_icon="  "

# Function to get LAN network name
get_lan_network_name() {
    #local ip_address=$(ip route get 1 | awk '{print $(NF-2);exit}')
    #local network_name=$(getnet hosts "$ip_address" | awk '{print $2}')
    echo "Connected"
}

# Function to get Wi-Fi network name
get_wifi_network_name() {
    local ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    echo "$ssid"
}

if [[ $(systemctl status NetworkManager | grep "Active:" | awk '{print $2}') == "active" ]]; then
    if ip link show enp0s25 | grep -q "state UP"; then
        icon=$wired_icon
        network=$(get_lan_network_name)
    elif [ ! -z $(nmcli -t -f active,ssid dev wifi | grep '^yes') ]; then
        icon=$wifi_icon
        network=$(get_wifi_network_name)
    elif ifconfig | grep -q "wlp2s0mon"; then
        icon=$monitormode_icon
        network="Monitor Mode"
    else
        icon=$disconnected_icon
        network="Disconnected"
    fi
elif ifconfig | grep -q "wlp2s0mon"; then
    icon=$monitormode_icon
    network="Monitor Mode"
else
    icon=$disconnected_icon
    network="Disconnected"
fi

# Format the output
output="%{F$icon_color}$icon%{F$text_color}$network%{F-}"
echo "$output"

