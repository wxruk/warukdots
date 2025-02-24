#!/bin/bash

cd ~/.cache/

# determine the appropriate privilege escalation command
if command -v sudo > /dev/null 2>&1; then
    su="sudo"
elif command -v doas > /dev/null 2>&1; then
    su="doas"
else
  echo "no doas or sudo found, please install one of them"
  exit 1
fi

# function to install packages on Fedora
install_fedora() {
	echo "Fedora (based) distro found"
	echo "i can't test fedora yet, so no support for it"
    exit 0
	#$su dnf install python-pywal16 neovim hyprland swaync swww grim kitty rofi chromium eza hyprlock ttf-jetbrainsmono-nerd hyprpolkitagent xdg-desktop-portal-hyprland -y
	#pip install --user pywal16 --break-system-packages
}

# function to install packages on Arch 
install_arch() {
    echo "Arch (based) distro found"
    if command -v yay > /dev/null 2>&1; then
        yay -S python-pywal16 neovim hyprland zsh waybar python-pip swaync swww grim kitty rofi-wayland chromium eza hyprlock ttf-jetbrainsmono-nerd hyprpolkitagent xdg-desktop-portal-hyprland --noconfirm
    elif command -v paru > /dev/null 2>&1; then
        paru -S python-pywal16 neovim hyprland zsh waybar python-pip swaync swww grim kitty rofi-wayland chromium eza hyprlock ttf-jetbrainsmono-nerd hyprpolkitagent xdg-desktop-portal-hyprland --noconfirm
    else
        echo "No AUR helper found, installing yay"
        if ! command -v git > /dev/null 2>&1 || ! command -v makepkg > /dev/null 2>&1; then
            $su pacman -S git base-devel --noconfirm
        fi
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        yay -S python-pywal16 neovim hyprland zsh waybar python-pip swaync swww grim kitty rofi-wayland chromium eza hyprlock ttf-jetbrainsmono-nerd hyprpolkitagent xdg-desktop-portal-hyprland --noconfirm
    fi
}

# determine the distribution
if command -v dnf > /dev/null 2>&1; then
    install_fedora
elif command -v pacman > /dev/null 2>&1; then
    install_arch
elif command -v apt > /dev/null 2>&1; then
	echo "hyprland is unstable on debian-based, so i do not recommend using hyprland on debian"
	exit 0
else
    echo "your distro is not supported."
    exit 1
fi

# clone and set up dotfiles
git clone https://github.com/wxruk/warukdots
cp -r warukdots/config/* ~/.config/
if [ -d ~/.oh-my-zsh ]; then
	rm -rf ~/.oh-my-zsh
fi
chmod +x ~/.cache/warukdots/omzinstall.sh
sh -c "./~/.cache/warukdots/omzinstall.sh"
cp warukdots/zshrc ~/.zshrc 
cp -r warukdots/eza-zsh ~/.oh-my-zsh/plugins/eza-zsh
chmod +x ~/.config/hypr/wallpaper.sh
chmod +x ~/.config/hypr/autostart.sh
chmod +x ~/.config/hypr/xdph.sh
chsh $USER -s /usr/bin/zsh
echo "hyprland dots installed"
