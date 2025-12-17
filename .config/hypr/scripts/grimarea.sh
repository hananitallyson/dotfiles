#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"
grim -g "$(slurp)" "$FILE"
wl-copy < "$FILE"
