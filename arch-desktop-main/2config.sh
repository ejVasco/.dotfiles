#!/bin/bash
# .dotfiles/arch-desktop-main/2config.sh
# Enables services and links config files

#------------------------------------------------
# some boilerplate stuff

# Exit immediately if a command fails, an undefined variable is used, or a pipe fails
set -euo pipefail
# Function to output info messages
info() {
    echo "[INFO] $*"
}

#------------------------------------------------
# directories

# Get the directory of the script 
MAIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#------------------------------------------------
# Enable services

# Enable system services
info "Enabling NetworkManager system-wide..."
sudo systemctl enable --now NetworkManager
# Enable user services
info "Enabling swaync user service (notification daemon)..."
systemctl --user enable --now swaync
systemctl --user restart swaync

#------------------------------------------------
# MISCELLANEOUS
# zsh (better shell)
info "Changing default shell to zsh..."
chsh -s /bin/zsh
#------------------------------------------------
# setting configs

# Symlink function (checks if file exists, backs up, and then links)
link_file() {
    local source="$1"
    local target="$2"
    if [ -e "$target" ] || [ -L "$target" ]; then
        info "Backing up existing $(basename "$target") to ${target}.bak"
        mv "$target" "${target}.bak"
    fi
    ln -s "$source" "$target"
    info "Linked $source -> $target"
}
# Ensure ~/.config directory exists
mkdir -p "$HOME/.config"
# Link individual config files
info "Linking dotfiles..."
link_file "$MAIN_DIR/.zshrc" "$HOME/.zshrc"
# link_file "$MAIN_DIR/.config/tmux" "$HOME/.config/tmux"
# link_file "$MAIN_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$MAIN_DIR/.config/kitty" "$HOME/.config/kitty"
# link_file "$MAIN_DIR/.config/hypr" "$HOME/.config/hypr"
# link_file "$MAIN_DIR/.config/waybar" "$HOME/.config/waybar"

#------------------------------------------------

info "Setup complete!"
