#!/usr/bin/env bash

echo "[*] Installing Tmux + Starship configs..."

source "$(dirname "$0")/../.env"

ln -sfn "$(dirname "$0")/../configs/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config

ln -sfn "$(dirname "$0")/../configs/starship.toml" ~/.config/starship.toml

ln -sfn "$(dirname "$0")/../configs/config" ~/.config/ghostty/config
