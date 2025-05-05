#!/usr/bin/env bash

echo "[*] Setting up Python..."

source "$(dirname "$0")/../.env"

sudo pacman -S --noconfirm python python-pip python-virtualenv

mkdir -p "$PYTHON_VENV_DIR"

if [ ! -d "$PYTHON_VENV_DIR/$VENV_NAME" ]; then
    python -m venv "$PYTHON_VENV_DIR/$VENV_NAME"
fi
