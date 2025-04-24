#!/bin/bash
#-----------------------------------------------
# Current list of things this file does
# 1 Downloads repos for zsh-autosuggestions and zsh-syntax-highlighting to be used as oh my zsh plugins
# ^ change this, i want to put the repo's in submodules that get sym linked to their needed location instead
# 4 firacode nerd font
# 3 syncthing
# 4 tailscale
# 5 zoxide
# 6 elevates some flatpak perms
#-----------------------------------------------
echo "Running other setup stuff that didn't really fit other scripts..."
#------------------------------------------------
# oh my zsh plugin stuff
# Set Oh My Zsh custom plugin path
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
# Function to clone a plugin if not already present
clone_plugin() {
  local name=$1
  local repo=$2
  local target="$ZSH_CUSTOM/plugins/$name"
  if [ ! -d "$target" ]; then
    echo "Cloning $name plugin..."
    git clone "$repo" "$target"
  else
    echo "$name plugin is already installed."
  fi
}
# Clone zsh plugins
clone_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
#------------------------------------------------
# hack nerd font
echo "Installing Fira Code Nerd Font..."
brew install --cask font-fira-code-nerd-font
brew install --cask font-fira-mono-nerd-font
#------------------------------------------------
# syncthing
echo "Setting up Syncthing systemd service..."
if command -v syncthing &> /dev/null; then
  systemctl --user enable syncthing.service
  systemctl --user start syncthing.service
  echo "Syncthing systemd service enabled and started."
else
  echo "Syncthing not found, skipping service setup."
fi
#------------------------------------------------
# tailscale
echo "Installing Tailscale..."
if ! command -v tailscale &> /dev/null; then
  curl -fsSL https://tailscale.com/install.sh | sh
  echo "Tailscale installed."
else
  echo "Tailscale is already installed."
fi
echo "Enabling and starting Tailscale..."
# Enable the service (system-wide, requires sudo)
sudo systemctl enable --now tailscaled
# Bring up Tailscale – this will prompt for auth if not already logged in
if ! tailscale status &> /dev/null; then
  echo "Running 'sudo tailscale up' to connect..."
  sudo tailscale up
else
  echo "Tailscale is already up and running."
fi
#------------------------------------------------
# zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
if [ $? -eq 0 ]; then
    echo "zoxide installed successfully!"
else
    echo "Failed to install zoxide."
fi
#------------------------------------------------
# elevating flatpak permissions
echo "Elevating permissions of certain flatpaks"
flatpak override --user --device=all cc.arduino.arduinoide
flatpak override --user --filesystem=host cc.arduino.arduinoide
echo "Elevating user permissions"
sudo usermod -aG dialout $USER # this gives user more USB permissions or something
#------------------------------------------------
echo "All tasks in 5_other.sh completed!"
