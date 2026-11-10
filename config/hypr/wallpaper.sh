#!/usr/bin/env bash
set -e

config_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
#set path to wallpaper after "="
WALLPAPER="${1:-$config_dir/wallpapers/winterlofi.jpg}"

wal -q -i "$WALLPAPER"
awww img "$WALLPAPER"
cp -- "$WALLPAPER" "$config_dir/wallpaper"
if [ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
    hyprctl reload
fi
swaync-client -rs || true
