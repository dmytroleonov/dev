#!/usr/bin/env bash

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git $HOME/packages/yay-bin
cd "$HOME"/packages/yay-bin
makepkg -si
