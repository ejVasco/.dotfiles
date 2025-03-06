#!/bin/bash

# Define the basic files directory
BASICFILES_DIR="$HOME/.dotfiles/basic"

# List of files/folders to symlink
declare -A FILES
FILES[".zshrc"]="$HOME/.zshrc"
FILES[".config/tmux"]="$HOME/.config/tmux"

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

echo "Symlink setup complete!"

