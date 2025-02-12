#!/bin/bash

if ! command -v yay &> /dev/null; then
    echo "yay не найден. Устанавливаю yay..."
    cd /tmp || exit
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay уже установлен."
fi

cd ~/.cache/ || exit

yay -S python-pywal16 neovide neovim hyprland swaync swww grim kitty rofi chromium eza hyprlock ttf-jetbrainsmono-nerd --noconfirm

git clone https://github.com/wxruk/warukdots
cp -r warukdots/config/* ~/.config/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp warukdots/zshrc ~/.zshrc 
cp -r warukdots/eza-zsh ~/.oh-my-zsh/plugins/eza-zsh
chmod +x ~/.config/hypr/wallpaper.sh
chmod +x ~/.config/hypr/autostart.sh
chsh "$USER" -s /usr/bin/zsh
echo "hyprland dots успешно установлены."
