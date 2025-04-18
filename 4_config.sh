#!/bin/bash
#-----------------------------------------------
# List of config files being linked 
# 1 .zshrc
#-----------------------------------------------
echo "Linking config files..."
#------------------------------------------------
# ZSH config
ZSHRC_SOURCE="$HOME/.dotfiles/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

if [ -e "$ZSHRC_TARGET" ] || [ -L "$ZSHRC_TARGET" ]; then
  rm -f "$ZSHRC_TARGET"
fi
ln -s "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
echo ".zshrc symlinked."
#------------------------------------------------

#------------------------------------------------
echo "All config files linked!"
