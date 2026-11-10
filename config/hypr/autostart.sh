#!/usr/bin/env bash
config_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
awww-daemon &
systemctl --user start hyprpolkitagent
for attempt in {1..50}; do
    awww query >/dev/null 2>&1 && break
    sleep 0.1
done
bash "$config_dir/wallpaper.sh"
bash "$config_dir/xdph.sh"
