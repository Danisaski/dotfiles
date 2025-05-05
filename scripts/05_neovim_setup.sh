#!/usr/bin/env bash

echo "[*] Linking Neovim config from submodule..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config

ln -sfn "$SCRIPT_DIR/../configs/nvim" ~/.config/nvim
