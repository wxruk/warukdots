#!/bin/bash
#set path to wallpaper after "="
export WALLPAPER=~/.config/hypr/wallpapers/mountain-lake.jpg

wal -q -i $WALLPAPER
swww img $WALLPAPER
cp $WALLPAPER $HOME/.config/hypr/wallpaper
