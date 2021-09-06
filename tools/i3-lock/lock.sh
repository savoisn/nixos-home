#!/usr/bin/env bash
icon="$HOME/.config/i3/lock.png"
# create a temp file
img=$(mktemp /tmp/XXXXXXXXXX.png)
# Take a screenshot of current desktop
import -screen -window root $img 
desktop_width=$(identify -format "%w" $img)
# Pixelate the screenshot
convert $img -scale 10% -scale 1000% $img
# Alternatively, blur the screenshot (slow!)
#convert $img -blur 2,5 $img
lock_x=$(expr $desktop_width / 4)
# Gravity center does the calculation for you to put it in the middle using the icon width and heigth
# Add the lock image
convert $img $icon -gravity Center -geometry +$lock_x+0 -composite $img
convert $img $icon -gravity Center -geometry -$lock_x+0 -composite $img
# Run i3lock with custom background
i3lock -i $img
# Remove the tmp file
rm $img
