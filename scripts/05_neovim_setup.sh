#!/usr/bin/env bash

echo "[*] Configuring Neovim..."

source "$(dirname "$0")/../.env"

if [ ! -d "$HOME/.config/nvim" ]; then
    git clone "$NEOVIM_REPO" ~/.config/nvim
fi
