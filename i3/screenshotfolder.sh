#! /bin/bash

# Deleting the 'Screenshots' folder when it's empty

folder="$HOME/Screenshots"

if [ -d $folder ]; then
    if [ -z "$(ls -A $folder)" ]; then
        rmdir $folder
    fi
fi
