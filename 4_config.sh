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
# copyq config
COPYQ_SOURCE="$HOME/.dotfiles/configs/copyq/copyq.conf"
COPYQ_TARGET="$HOME/.config/copyq/copyq.conf"
if [ -e "$COPYQ_TARGET" ] || [ -L "$COPYQ_TARGET" ]; then
  rm -f "$COPYQ_TARGET"
fi
ln -s "$COPYQ_SOURCE" "$COPYQ_TARGET"
echo ".config/copyq/copyq.conf symlinked."
#------------------------------------------------
echo "All config files linked!"
