#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -S --needed --noconfirm zsh-autocomplete-git
sudo pacman -S --needed --noconfirm zsh-syntax-highlighting zsh-autosuggestions
