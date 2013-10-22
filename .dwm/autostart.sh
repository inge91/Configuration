#!/bin/sh

# keyboard repeat rate and mouse acceleration
xset r rate 250 25 &
xset m 0 0 &

# powersavings or something
xset +dpms &
xset dpms 0 0 300 &

# bind escape to capslock
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# horizontal scrolling
synclient HorizTwoFingerScroll=1 &
synclient TapButton1=1 &

# background
feh --bg-scale ../wallpaper.png &

# progams to autostart
#urxvtd &
nm-applet &
volumeicon &
xfce4-power-manager &
#dwm_bar.sh &
