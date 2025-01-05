#!/bin/bash

# Define the themes
DAY_THEME="BreezeClassic"
NIGHT_THEME="BreezeDark"
WALLPAPERS_DAY="/home/alligator/Изображения/wallpapers/Holmy.jpg"
WALLPAPERS_NIGHT="/home/alligator/Изображения/wallpapers/Holmy_Night.jpg"

# Get the current hour
CURRENT_TIME="$(date +'%s')"
lower_bound="$(date -d '9:45' +'%s')"
upper_bound="$(date -d '15:45' +'%s')"

# Determine the desired theme based on the time
if (( $lower_bound <= CURRENT_TIME && CURRENT_TIME < $upper_bound )); then
    COLOR="#f1c992"
    DESIRED_THEME="$DAY_THEME"
    WALLPAPERS="$WALLPAPERS_DAY"
    plasma-apply-colorscheme -a "$COLOR"
    plasma-apply-colorscheme -a "$COLOR"
else
    COLOR="#92aef1"
    DESIRED_THEME="$NIGHT_THEME"
    WALLPAPERS="$WALLPAPERS_NIGHT"
    plasma-apply-colorscheme -a "$COLOR"
    plasma-apply-colorscheme -a "$COLOR"

fi

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
    paplay /home/$USER/.theme-switcher/sound.wav
    plasma-apply-colorscheme -a "$COLOR"
    plasma-apply-colorscheme -a "$COLOR"
fi

