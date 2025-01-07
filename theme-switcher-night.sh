#!/bin/bash

# Define the themes
NIGHT_THEME="BreezeDark"
WALLPAPERS_NIGHT="./Holmy_Night.jpg"
COLOR="#92aef1"
DESIRED_THEME="$NIGHT_THEME"
WALLPAPERS="$WALLPAPERS_NIGHT"

# Get the current theme marked as "current"
CURRENT_THEME=$(plasma-apply-colorscheme -l | grep "текущая цветовая схема" | awk '{print $2}')

# Check if the desired theme is already active
if [[ "$CURRENT_THEME" == "$DESIRED_THEME" ]]; then
    notify-send -a theme-switcher $CURRENT_THEME "уже установлена"
else
    # Apply the desired theme
    plasma-apply-colorscheme "$DESIRED_THEME"
    plasma-apply-wallpaperimage $WALLPAPERS
    notify-send -a theme-switcher $DESIRED_THEME "успешно задана для использования в Plasma"
    paplay ./sound.wav
    plasma-apply-colorscheme -a "$COLOR"
    plasma-apply-colorscheme -a "$COLOR"
fi

