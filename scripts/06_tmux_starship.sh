#!/usr/bin/env bash

echo "[*] Installing Tmux + Starship configs..."

source "$(dirname "$0")/../.env"

cp ./configs/.tmux.conf ~/
mkdir -p ~/.config
cp ./configs/starship.toml ~/.config/
