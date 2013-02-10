#!/bin/sh

# keyboard repeat rate
xset r rate 250 25 &

# powersavings or something
xset +dpms
xset dpms 0 0 300

# bind escape to capslock
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# horizontal scrolling
synclient HorizTwoFingerScroll=1 &

# background
feh --bg-scale ../wallpaper.jpeg &

# progams to autostart
urxvtd &
nm-applet &
volumeicon &
xfce4-power-manager &

