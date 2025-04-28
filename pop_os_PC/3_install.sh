#!/bin/bash
set -e

echo "[*] Running install.sh — installing apt and brew packages..."

# ----------------------------
# 1. Update & upgrade system and other packages
# ----------------------------
echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y
echo "[*] Updating APT packages..."
sudo apt update
# only updates flatpak if its found
if command -v flatpak &> /dev/null; then
    echo "[*] Updating Flatpak packages..."
    flatpak update -y
else
    echo "[!] Flatpak not found. Skipping Flatpak updates."
fi
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
#------------------------------------------------
# 4. Install packages from flatpak_packages.txt
#------------------------------------------------
FLATPAK_FILE="flatpak_packages.txt"
if command -v flatpak &> /dev/null; then
    echo "[*] Installing Flatpak packages from $FLATPAK_FILE..."
    if [[ -f "$FLATPAK_FILE" ]]; then
        # Loop through each Flatpak package in the file and install it
        while IFS= read -r package; do
            echo "[*] Installing Flatpak package: $package"
            flatpak install -y flathub "$package"
        done < "$FLATPAK_FILE"
    else
        echo "[!] $FLATPAK_FILE not found. Skipping Flatpak installs."
    fi
else
    echo "[!] Flatpak not found. Skipping Flatpak installs."
fi
#------------------------------------------------
echo "[✓] install.sh complete."
