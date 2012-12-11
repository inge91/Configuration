#! /usr/bin/env bash

ln -s $(pwd)/.vim ~
ln -s $(pwd)/.vimrc ~

ln -s $(pwd)/.Xresources ~

ln -s $(pwd)/.tmux.conf ~

ln -s $(pwd)/.fonts ~

# check if there's already a .config/awesome folder, and if not create it
if [ ! -d "~/.config/awesome" ]; then
    mkdir -p ~/.config/awesome
fi

ln -s $(pwd)/rc.lua ~/.config/awesome/
