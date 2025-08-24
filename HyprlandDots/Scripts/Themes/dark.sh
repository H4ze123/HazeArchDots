#!/bin/bash

theme="prefer-dark"
gtk_theme="adw-gtk3-dark"
cursor_theme="Bibata-Modern-Classic"
type="dark"

gsettings set org.gnome.desktop.interface color-scheme "$theme"
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme"

echo -e "\$cursortheme = $cursor_theme" > $HOME/.config/hypr/config/cursortheme.conf

echo "$type" > $HOME/Dots/Options/theme
echo "main" > $HOME/.config/waybar/type   
cp -a $HOME/.config/waybar/configs/$type/. $HOME/.config/waybar/
cp -a $HOME/.config/swaync/themes/$type/. $HOME/.config/swaync/
cp -a $HOME/.config/rofi/options/$type/. $HOME/.config/rofi/
cp -a $HOME/.config/hypr/configs/default/hyprland.conf $HOME/.config/hypr/
mv $HOME/Pictures/Wallpapers/* $HOME/Pictures/Temp
mv $HOME/Pictures/notusingrn/* $HOME/Pictures/Wallpapers
mv $HOME/Pictures/Temp/* $HOME/Pictures/notusingrn
sleep 0.5 

killall waybar
waybar &

swaync-client -R
swaync-client -rs

hyprctl reload

sleep 0.5
