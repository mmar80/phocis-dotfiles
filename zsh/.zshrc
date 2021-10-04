source "$XDG_CONFIG_HOME/zsh/aliases"

autoload -U compinit; compinit

# autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

# push current directory to top of stack
setopt AUTO_PUSHD
# do not store dupe dir on stack
setopt PUSHD_IGNORE_DUPS
# do not print directory stack after using pushd or popd
setopt PUSHD_SILENT

# fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# start i3 after startup
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
