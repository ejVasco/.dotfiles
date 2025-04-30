#!/bin/bash

set -e

# Update and install APT packages if apt is available
if command -v apt &> /dev/null; then
    echo "Updating APT..."
    sudo apt update
    echo "Installing APT packages..."
    xargs -a apt_packages.txt sudo apt install -y
else
    echo "APT not found. Skipping APT package installation."
fi

# Install Brew packages if brew is available
if command -v brew &> /dev/null; then
    echo "Installing Homebrew packages..."
    xargs -a brew_packages.txt brew install
else
    echo "Homebrew not found. Skipping Brew package installation."
fi

# Install Flatpak packages if flatpak is available
if command -v flatpak &> /dev/null; then
    echo "Installing Flatpak packages..."
    while read -r package; do
        [ -z "$package" ] && continue
        flatpak install -y --noninteractive flathub "$package"
    done < fp_packages.txt
else
    echo "Flatpak not found. Skipping Flatpak package installation."
fi

echo "All available packages processed."

