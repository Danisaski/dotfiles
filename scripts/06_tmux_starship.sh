#!/usr/bin/env bash

echo "[*] Installing Tmux + Starship + Ghostty + Alacritty configs..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../.env"

mkdir -p ~/.config

ln -sfn "$SCRIPT_DIR/../configs/.tmux.conf" ~/.tmux.conf

ln -sfn "$SCRIPT_DIR/../configs/starship.toml" ~/.config/starship.toml

ln -sfn "$SCRIPT_DIR/../configs/config" ~/.config/ghostty/config

ln -sfn "$SCRIPT_DIR/../configs/.alacritty.toml" ~/.alacritty.toml
