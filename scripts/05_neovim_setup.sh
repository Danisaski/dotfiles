#!/usr/bin/env bash

echo "[*] Linking Neovim config from submodule..."

mkdir -p ~/.config

ln -sfn "$(dirname "$0")/../configs/nvim" ~/.config/nvim
