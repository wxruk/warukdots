#!/bin/bash

yay -S python-pywal16 neovide neovim hyprland swaync swww grim kitty rofi chromium
git clone https://github.com/wxruk/warukdots
cp -r warukdots/config/* ~/.config/
cp warukdots/zshrc ~/.zshrc 
cp -r .oh-my-zsh ~/.oh-my-zsh
chmod +x ~/.config/hypr/wallpaper.sh
chmod +x ~/.config/hypr/autostart.sh

echo run chsh and choose /usr/bin/zsh
