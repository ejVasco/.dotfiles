#!/bin/bash
set -e

echo "[*] Running 1_zsh.sh — setting up Zsh and Oh My Zsh..."

# 1. Install zsh if not installed
echo "[*] Checking if zsh is installed..."
if ! command -v zsh &> /dev/null; then
    echo "[*] Zsh not found. Installing..."
    sudo apt update
    sudo apt install -y zsh
else
    echo "[*] Zsh is already installed."
fi

# 2. Change default shell to zsh if it's not already
echo "[*] Checking default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "[*] Changing default shell to zsh..."
    chsh -s "$(which zsh)"
else
    echo "[*] Default shell is already zsh."
fi

# 3. Install Oh My Zsh if not installed
echo "[*] Checking if Oh My Zsh is installed..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[*] Installing Oh My Zsh..."
    export RUNZSH=no  # Prevents auto-launch
    export CHSH=no    # You've already handled the shell change
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "[*] Oh My Zsh is already installed."
fi

echo "[✓] 1_zsh.sh complete. You should reboot or logout/login to apply the shell change."
echo "[*] This MUST be done before you continue with running the subsequent scripts."

