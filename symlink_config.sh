#! /usr/bin/env bash

ln -s $(pwd)/.vim ~
ln -s $(pwd)/.vimrc ~

ln -s $(pwd)/.Xresources ~

ln -s $(pwd)/.tmux.conf ~

ln -s $(pwd)/.fonts ~

# check if there's already a ~/.config/folder, and if not create it
if [ ! -d "~/.config/" ]; then
    mkdir -p ~/.config/
fi

ln -s $(pwd)/awesome ~/.config/

if [ ! -d "~/.xmonad/" ]; then
    mkdir -p ~/.xmonad/
fi

ln -s $(pwd)/xmonad.hs ~/.xmonad/
ln -s $(pwd)/.xmobarrc ~
