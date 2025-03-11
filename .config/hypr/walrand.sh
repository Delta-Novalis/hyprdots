#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
echo -e "preload = $WALLPAPER\nwallpaper = , $WALLPAPER" > "$HOME/.config/hypr/hyprpaper.conf"