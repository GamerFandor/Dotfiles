#! /usr/bin/env bash

# Terminate alread running bar instances
polybar-msg cmd quit

# Launch bar
echo --- | tee -a /tmp/polybar1.log
polybar topbar 2>&1 | tee -a /tmp/polybar1.log & disown

echo Bars launched . . .
