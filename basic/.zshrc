# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rjn/.zshrc' # pc user
# zstyle :compinstall filename '/home/ejv/.zshrc' # laptop user
autoload -Uz compinit
compinit

# End of lines added by compinstall
eval "$(zoxide init zsh)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

#for android dev, requires android dev stuff obv, on my main pc
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# Created by `pipx` on 2024-09-21 06:37:59
export PATH="$PATH:/home/rjn/.local/bin"

# Autosuggestions in zsh, requires zsh-autosuggestions package
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax highlighting on commands in zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The prompt in terminal
PS1='%F{#8000FF}rjn%f %F{#00FFFF}%~%f %# ' # main pc user
# PS1='%F{#8000FF}ejv%f %F{#00FFFF}%~%f %# ' # laptop user

# -------------------------------------------------------------------
# Aliases
	# requires discordo
alias disc='~/scripts_n_binds/discordo_token.sh'
	# for python virtual environments
alias venv_activate='source .venv/bin/activate'
alias venv_create='python -m venv .venv && source .venv/bin/activate'
alias venv_delete='rm -rf .venv'
	# neovim equivalent of exit that i keep accidentally typing
alias :q='exit'
	# terminal based file manager/explorer (kinda complicated to use) (yazi package)
alias files='yazi'
	# better ls command from eza package
alias ls='eza --icons'
alias ls_details='eza -l'
alias ls_tree='eza -T'
alias ls_all='eza -a'
alias ls_all_details='eza -la'
compdef eza=ls # ls -> eza aliases will use ls completion
	# markdown in cmd viewer (can be used for more)
alias md='glow'
alias md_live='~/scripts_n_binds/md_live.sh'
	# proper clear kitty terminal
alias clear='reset'
	# for checking my own keybind documentation
alias binds='~/scripts_n_binds/keybinds/binds.sh'
	# 
alias cast='scrcpy'
	# easier tmux attaching to named session
alias tmuxa='tmux a -t'
	# aliases for setting github author basically
alias git_auth_ejVasco='git config user.name "ejVasco" && git config user.email "111936685+ejVasco@users.noreply.github.com"'
alias git_auth_ren='git config user.name "ren-real" && git config user.email "160364326+ren-real@users.noreply.github.com"'
	# bc i stupid and mess up lazy git
alias gitlazy='lazygit'
# -------------------------------------------------------------------
fpath+=(~/.zsh/completions)
