#!/usr/bin/env bash

echo "[*] Installing base packages..."

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm base-devel git curl wget unzip zip sudo \
    jdk-openjdk fzf ripgrep lazygit zsh tmux neovim starship npm clang
