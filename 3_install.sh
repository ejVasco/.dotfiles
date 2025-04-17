#!/bin/bash
set -e

echo "[*] Running install.sh — installing apt and brew packages..."

# ----------------------------
# 1. Update & upgrade system
# ----------------------------
echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y

# ---------------------------------------
# 2. Install packages from apt_packages.txt
# ---------------------------------------
APT_FILE="apt_packages.txt"

if [[ -f "$APT_FILE" ]]; then
    echo "[*] Installing packages from $APT_FILE..."
    xargs -a "$APT_FILE" sudo apt install -y
else
    echo "[!] $APT_FILE not found. Skipping APT installs."
fi

# -----------------------------------------
# 3. Install packages from brew_packages.txt
# -----------------------------------------
BREW_FILE="brew_packages.txt"

if command -v brew &> /dev/null; then
    echo "[*] Installing packages from $BREW_FILE..."
    if [[ -f "$BREW_FILE" ]]; then
        xargs brew install < "$BREW_FILE"
    else
        echo "[!] $BREW_FILE not found. Skipping brew installs."
    fi
else
    echo "[!] Homebrew not found. Skipping brew installs."
fi

echo "[✓] install.sh complete."
