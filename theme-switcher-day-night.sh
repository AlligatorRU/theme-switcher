#!/bin/bash

# Define the themes
DAY_THEME="BreezeClassic"
NIGHT_THEME="BreezeDark"
WALLPAPERS_DAY="$HOME/theme-switcher/Holmy.jpg"
WALLPAPERS_NIGHT="$HOME/theme-switcher/Holmy_Night.jpg"
COLOR_DAY="#f1c992"
COLOR_NIGHT="#92aef1"

# Get the current theme marked as "current"
CURRENT_THEME=$(plasma-apply-colorscheme -l | grep "текущая цветовая схема" | awk '{print $2}')

# Check if the desired theme is already active
if [[ "$CURRENT_THEME" == "$DAY_THEME" ]]; then
    plasma-apply-colorscheme "$NIGHT_THEME"
    plasma-apply-wallpaperimage $WALLPAPERS_NIGHT
    plasma-apply-colorscheme -a "$COLOR_NIGHT"
    plasma-apply-colorscheme -a "$COLOR_NIGHT"
    notify-send -a theme-switcher $NIGHT_THEME "успешно задана для использования в Plasma"
    paplay /home/$USER/.theme-switcher/sound.wav
    else
    plasma-apply-colorscheme "$DAY_THEME"
    plasma-apply-wallpaperimage $WALLPAPERS_DAY
    plasma-apply-colorscheme -a "$COLOR_DAY"
    plasma-apply-colorscheme -a "$COLOR_DAY"
    notify-send -a theme-switcher $DAY_THEME "успешно задана для использования в Plasma"
    paplay /home/$USER/.theme-switcher/sound.wav
fi

