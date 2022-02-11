#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return
alias ls='lsd '
alias ..='cd ..'

#PS1='[\u@\h \W]\$ '
##TERM= alacritty
# set PATH so it includes user's private ~/.local/bin if it exists
#temporarely add  biber

export RANGER_LOAD_DEFAULT_RC=FALSE
export VISUAL=nvim
export EDITOR=nvim
export PATH=$HOME/neovim/bin:$PATH
export PATH=$PATH:$HOME/go/bin
#export GOPATH=$HOME/go/src
export GOPATH=$HOME/publichtml/goWork

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#My personal aliases

alias du='dust'
alias cat='bat'
alias v='nvim'
alias n='nvim'
alias vim='n'
alias vconf='n .config/nvim/init.vim'
alias spegniti='shutdown now'
alias sfondo='feh --randomize --bg-fill /usr/share/backgrounds/archlinux/*'
alias stu='cd ~/Documents/Studia && ls'
alias pub='cd ~/publichtml && ls'
alias goWork=' cd ~/publichtml/goWork/src/github.com/zazangra && ls'
alias c='cd && clear && paleofetch'
alias mirror.sh='~/bin/mirror.sh'
alias icat='kitty +kitten icat'
alias p='pwd'
alias syu='sudo pacman -Syu'
alias gdmon='sudo systemctl enable gdm'
alias gdmoff='sudo systemctl disable gdm'
alias ll='ls -al'
alias r='ranger'
#alias gitp='wl-copy -n < supersecret'
alias gitc='git config --global credential.credentialStore cache'


#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
source <(kitty + complete setup bash)
eval "$(starship init bash)"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_ALT_C_OPTS="--preview 'tree -C {}| head -200'"
# make dir and cd in it
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }





# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/alessandro/google-cloud-sdk/path.bash.inc' ]; then . '/home/alessandro/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/alessandro/google-cloud-sdk/completion.bash.inc' ]; then . '/home/alessandro/google-cloud-sdk/completion.bash.inc'; fi


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
