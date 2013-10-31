#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set some X stuff
xset +fp ~/.fonts
xset fp rehash
xset +dpms
xset dpms 0 0 300
xset r rate 250 25
xset m 0 0

xsetroot -cursor_name left_ptr
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
xrdb ~/.Xresources

# wallpaper
feh --bg-tile ~/.dwm/flowers.png

# system tray
trayer --edge top --align right --widthtype percent --width 5 --height 22 --tint 0x151515 --transparent true --alpha 0 &

exec xmonad
