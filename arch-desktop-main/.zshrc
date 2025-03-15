# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rjn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#------------------------------------------------
# Lines added by ejVasco after here
#------------------------------------------------

# autosuggestions based on command history (requires zsh-autosuggestions package)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# better command highlighting (requires zsh-syntax-highlighting package)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ignore duplicates in history
setopt histignorealldups
# share history between open terminals, normally they have individual history
# and this individual history is added to global history when that terminal is closed
setopt sharehistory
# recall commands from history using `!!` for last command or `!<num>` for specific
# without this option set, the command runs immediately, this allows you to edit it
setopt histverify
# removes extra spaces in history
setopt histreduceblanks
# appends history immediately instead of waiting till its closed.
setopt appendhistory

# copied from fzf github
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
