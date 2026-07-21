#!/bin/bash
#set path to wallpaper after "="
export WALLPAPER=~/.config/hypr/wallpapers/winterlofi.jpg

wal -q -i $WALLPAPER
awww img $WALLPAPER
cp $WALLPAPER $HOME/.config/hypr/wallpaper
swaync-client -rs
