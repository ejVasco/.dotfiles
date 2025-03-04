#!/bin/bash

# Read package list and install using yay
while IFS= read -r package; do
    echo "Installing $package..."
    yay -S --noconfirm "$package"
done < "packages.txt"

echo "All packages installed!"
