#!/usr/bin/env bash

echo "[*] Installing base packages..."

source "$(dirname "$0")/../.env"

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm base-devel git curl wget unzip zip sudo \
    jdk17-openjdk fzf ripgrep lazygit zsh tmux neovim starship
