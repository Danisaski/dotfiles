#!/usr/bin/env bash

set -e

echo "[*] Starting environment setup..."

for script in ./scripts/*.sh; do
    echo "[*] Running $script"
    bash "$script"
done

echo "[✔] Setup complete! Reload your shell or run 'exec zsh'"
