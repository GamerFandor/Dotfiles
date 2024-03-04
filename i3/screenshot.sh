#! /bin/bash

mkdir -p $HOME/Screenshots

output="$HOME/Screenshots/\[%Y.%m.%d\]-\[%T\]-\[$(date +%N)\].png"

case "$1" in
    #"select") scrot $output --select --line mode=edge ;;
    "select") scrot $output --select --freeze ;;
    "window") scrot $output --focused --border ;;
    *) scrot $output ;;
esac

