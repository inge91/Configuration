#! /usr/bin/env bash

ln -s $(pwd)/.vim ~
ln -s $(pwd)/.vimrc ~

ln -s $(pwd)/.emacs.d ~

ln -s $(pwd)/.Xresources ~
ln -s $(pwd)/.xinitrc ~

ln -s $(pwd)/.tmux.conf ~

ln -s $(pwd)/.fonts ~

ln -s $(pwd)/.dwm ~

ln -s $(pwd)/openbox ~/.config/
ln -s $(pwd)/tint2 ~/.config/
ln -s $(pwd)/termcolors ~/.config/

ln -s $(pwd)/.xmobarrc ~
ln -s $(pwd)/.xmonad ~

[ -d ~/bin ] || mkdir ~/bin
ln -s $(pwd)/cmus_current_track.sh ~/bin/
ln -s $(pwd)/dwmstatus.sh  ~/bin/
