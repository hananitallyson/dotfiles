#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"
grim -g "$(hyprctl activewindow -j | jq -r '.at[0],.at[1],.size[0],.size[1] | @csv' | tr -d '"')" "$FILE"
wl-copy < "$FILE"
