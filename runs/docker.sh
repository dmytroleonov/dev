#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
