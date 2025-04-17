#!/bin/bash
#-----------------------------------------------
# List of config files being linked 
# 1 .zshrc
# 2 kitty.conf
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
# Kitty config
KITTY_CONF_DIR="$HOME/.config/kitty"
KITTY_CONF_SOURCE="$HOME/.dotfiles/configs/kitty/kitty.conf"
KITTY_CONF_TARGET="$KITTY_CONF_DIR/kitty.conf"
mkdir -p "$KITTY_CONF_DIR"
if [ -e "$KITTY_CONF_TARGET" ] || [ -L "$KITTY_CONF_TARGET" ]; then
  rm -f "$KITTY_CONF_TARGET"
fi
ln -s "$KITTY_CONF_SOURCE" "$KITTY_CONF_TARGET"
echo "Kitty config symlinked."
#------------------------------------------------
echo "All config files linked!"
