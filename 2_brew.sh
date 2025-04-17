#!/bin/bash
set -e

echo "[*] Running brew.sh — installing Homebrew and adding it to PATH..."

# Define Homebrew install location
BREW_PREFIX="/home/linuxbrew/.linuxbrew"

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
    echo "[*] Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "[*] Adding Homebrew to shell startup files..."

    # Add to .profile
    if ! grep -q "$BREW_PREFIX/bin/brew shellenv" "$HOME/.profile" 2>/dev/null; then
        echo "eval \"\$(${BREW_PREFIX}/bin/brew shellenv)\"" >> "$HOME/.profile"
    fi

    # Add to .zshrc
    if ! grep -q "$BREW_PREFIX/bin/brew shellenv" "$HOME/.zshrc" 2>/dev/null; then
        echo "eval \"\$(${BREW_PREFIX}/bin/brew shellenv)\"" >> "$HOME/.zshrc"
    fi

    # Apply to current shell session
    eval "$(${BREW_PREFIX}/bin/brew shellenv)"
else
    echo "[*] Homebrew is already installed."
    eval "$(${BREW_PREFIX}/bin/brew shellenv)"
fi

echo "[✓] Homebrew installed and added to PATH."

