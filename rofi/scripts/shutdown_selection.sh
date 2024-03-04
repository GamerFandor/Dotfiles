#! /bin/bash

options=(" Shutdown" " Reboot" " Logout")


option_string=$(printf "%s\n" "${options[@]}")
selected_option=$(echo -e "$option_string" | rofi -dmenu -p "Action" -i)

case $selected_option in
    " Shutdown")
	options=(" Shutdown" " Cancel")
        prompt="Are you sure, you want to shutdown the computer?"
	;;
    " Reboot")
	options=(" Reboot" " Cancel")
	prompt="Are you sure, you want to reboot the computer?"
    ;;
    " Logout")
	options=(" Logout" " Cancel")
	prompt="Are you sure, you want to logout?"
    ;;
    *)
        exit
	;;
esac

option_string=$(printf "%s\n" "${options[@]}")
apply_option=$(echo -e "$option_string" | rofi -dmenu -p "$prompt" -i)

if [[ $apply_option == " Cancel" ]]; then
    exit
fi

case $selected_option in
    " Shutdown")
	shutdown -a now
	;;
    " Reboot")
	reboot
    ;;
    " Logout")
	i3-msg exit
    ;;
esac
