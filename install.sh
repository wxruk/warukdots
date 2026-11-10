#!/bin/bash

mkdir -p "$HOME/.cache" "$HOME/.config" || exit 1
cd "$HOME/.cache" || exit 1

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
	local packages=(python-pywal16 neovim hyprland zsh waybar python-pip swaync awww grim kitty rofi-wayland chromium eza hyprlock ttf-jetbrains-mono-nerd hyprpolkitagent xdg-desktop-portal-hyprland
        git curl firefox nautilus wl-clipboard playerctl brightnessctl fastfetch pamixer pavucontrol blueberry wireplumber)
    echo "Arch (based) distro found"
    if command -v yay > /dev/null 2>&1; then
        yay -S "${packages[@]}" --noconfirm || exit 1
    elif command -v paru > /dev/null 2>&1; then
        paru -S "${packages[@]}" --noconfirm || exit 1

    else
        echo "No AUR helper found, installing yay"
        if ! command -v git > /dev/null 2>&1 || ! command -v makepkg > /dev/null 2>&1; then
            $su pacman -S git base-devel --noconfirm
        fi
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        yay -S "${packages[@]}" --noconfirm || exit 1
    fi
}

# determine the distro
if command -v dnf > /dev/null 2>&1; then
    install_fedora
elif command -v pacman > /dev/null 2>&1; then
    install_arch
elif command -v apt > /dev/null 2>&1; then
	echo "hyprland is unstable on debian-based and this dots is not supported on debian-based"
	exit 0
else
    echo "your distro is not supported."
    exit 1
fi

# clone and set up dotfiles
git clone https://github.com/wxruk/warukdots || exit 1
cp -r warukdots/config/* ~/.config/
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    omz_installer=$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) || exit 1
    ZSH="$HOME/.oh-my-zsh" sh -c "$omz_installer" "" --unattended --keep-zshrc || exit 1
fi
cp warukdots/zshrc ~/.zshrc 
mkdir -p "$HOME/.oh-my-zsh/custom/plugins/eza-zsh" || exit 1
cp -r warukdots/eza-zsh/. "$HOME/.oh-my-zsh/custom/plugins/eza-zsh/" || exit 1
chmod +x ~/.config/hypr/wallpaper.sh
chmod +x ~/.config/hypr/autostart.sh
chmod +x ~/.config/hypr/xdph.sh
chsh $USER -s /usr/bin/zsh
echo "hyprland dots installed"
