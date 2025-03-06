#!/bin/bash

# Define the basic files directory
BASICFILES_DIR="$HOME/.dotfiles/basic"

# List of files/folders to symlink
declare -A FILES
FILES[".zshrc"]="$HOME/.zshrc"
FILES[".config/tmux"]="$HOME/.config/tmux"
FILES[".config/nvim"]="$HOME/.config/nvim"

# -----------------------------------------------
#
# |- SHELL STUFF
#
echo ""
echo "- 1 - SETTING ZSH AS DEFAULT"
# Set default shell to zsh
if ! grep -q "zsh" /etc/shells; then 
    echo "/usr/bin/zsh" | sudo tee -a /etc/shells
fi
# Check if zsh is already the default shell
current_shell=$(echo $SHELL)
if [[ "$current_shell" != "/usr/bin/zsh" ]]; then
    chsh -s /usr/bin/zsh
    echo "- 1 - ZSH SET AS DEFAULT (logout/in for changes to take effect)"
else
    echo "- 1 - ZSH ALREADY DEFAULT (logout/in for changes to take effect)"
fi
# -----------------------------------------------
#
# |- SYMLINK STUFF
#
echo ""
echo "- 2 - SETTING SYMLINKS FOR CONFIG"
# Create necessary directories for symlinks
for dir in $(echo "${FILES[@]}" | sed 's/[^[:alnum:]\-\/]//g' | grep -o '/[^/]*$' | sort -u); do
    if [[ ! -d "$HOME$dir" ]]; then
        echo "Creating directory $HOME$dir"
        mkdir -p "$HOME$dir"
    fi
done
# Create symlinks
for file in "${!FILES[@]}"; do
    target="$BASICFILES_DIR/$file"
    link="${FILES[$file]}"
    # Ensure the target exists
    if [[ ! -e "$target" ]]; then
        echo "Skipping $file: Target does not exist in basic files directory."
        continue
    fi
    # Remove existing file if necessary
    if [[ -e "$link" || -L "$link" ]]; then
        echo "Removing existing $link"
        rm -rf "$link"
    fi
    # Create symlink
    ln -s "$target" "$link"
    echo "Created symlink: $link -> $target"
done
echo "- 2 - SYMLINK SETUP COMPLETE"
# -----------------------------------------------
#
# |- NPM stuff for neovim
#
echo ""
echo "- 3 - INSTALLING NPM DEPENDENCIES FOR NEOVIM"
# Install npm dependencies for markdown-preview.nvim if the plugin directory exists
PLUGIN_DIR="$HOME/.local/share/nvim/lazy/markdown-preview.nvim/app"
if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Skipping npm package installation for Neovim plugins."
else
    # Continue with the npm installation process
    if [ -d "$PLUGIN_DIR" ]; then
        echo "Installing npm dependencies for markdown-preview.nvim..."
        cd "$PLUGIN_DIR"
        npm install
        echo "- 3 - NPM INSTALL COMPLETE"
    else
        echo "Plugin directory $PLUGIN_DIR not found. Please run Neovim to initialize the plugin directory, then rerun script."
        echo "- 3 - NPM INSTALL FAIL"
    fi
fi
