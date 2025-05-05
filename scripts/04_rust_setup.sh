#!/usr/bin/env bash

echo "[*] Installing Rust..."

if [ ! -d "$HOME/.cargo" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

source "$HOME/.cargo/env"
