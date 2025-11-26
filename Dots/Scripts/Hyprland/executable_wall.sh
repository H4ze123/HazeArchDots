#!/bin/bash

sleep 1

monitor=$(cat $HOME/Dots/Options/mainmonitor)
cache_file="$HOME/.cache/swww/$monitor"

# koristimo strings da izvučemo putanju iz binarnog cache fajla
wallpaper=$(strings "$cache_file" | grep -v "^Lanczos3")

if [[ -z "$wallpaper" ]]; then
    echo "Wallpaper file not found in cache"
    exit 1
fi

genwal=$wallpaper
wallname=$(basename "$genwal")

rm -f $HOME/Dots/Options/wallpaper
ln -s $genwal $HOME/Dots/Options/wallpaper
echo "* { wallpaper: url(\"$genwal\", width); }" > "$HOME/.config/rofi/options/wallpaper.rasi"

wal -q -i "$genwal" &
$HOME/Dots/Scripts/Waybar/waybar.sh &

sleep 0.5

notify-send -i preferences-desktop-wallpaper-symbolic "Wallpaper Applied" "New color scheme generated from image:\n$wallname"

swaync-client -R
swaync-client -rs
