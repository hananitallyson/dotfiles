#!/usr/bin/env bash

selected=$(printf "⏻ Power Off\n Reboot\n󰜉 Suspend\n󰍃 Logout" \
           | wofi --dmenu --lines 4 --prompt "Power Menu" --sort-order=alphabetical --hide-search --width=10%)

pkill -x wofi || true
sleep 0.1

case "$selected" in
    "⏻ Power Off") systemctl poweroff ;;
    " Reboot")     systemctl reboot ;;
    "󰜉 Suspend")    systemctl suspend ;;
    "󰍃 Logout")     hyprctl dispatch exit ;;
esac
