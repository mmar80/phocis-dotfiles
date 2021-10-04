# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# xdotdir
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# history filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# maximum events for internal history
export HISTSIZE=10000
# maximum events in history file
export SAVEHIST=10000

export DOTFILES="$HOME/dotfiles"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"