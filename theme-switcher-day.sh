#!/bin/bash

# Define the themes
DAY_THEME="BreezeClassic"
WALLPAPERS_DAY="./Holmy.jpg"
COLOR="#f1c992"
DESIRED_THEME="$DAY_THEME"
WALLPAPERS="$WALLPAPERS_DAY"

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

