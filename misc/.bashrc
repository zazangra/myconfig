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

export PATH=$PATH:/home/alessandro/bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#My personal aliases

alias v='nvim'
alias n='nvim'
alias vim='n'
alias vconf='n .config/nvim/init.vim'
alias spegniti='shutdown now'
alias sfondo='feh --randomize --bg-fill /usr/share/backgrounds/archlinux/*'
alias stu='cd ~/Documents/Studia && ls'
alias pub='cd ~/publichtml && ls'
alias c='cd && clear && paleofetch'
alias mirror.sh='~/bin/mirror.sh'
alias icat='kitty +kitten icat'
alias p='pwd'
alias gitp='wl-copy -n < ~/Documents/IDs/tokengithub && cat ~/Documents/IDs/tokengithub'
alias syu='sudo pacman -Syu'
alias gdmon='sudo systemctl enable gdm'
alias gdmoff='sudo systemctl disable gdm'
alias ll='ls -al'

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
source <(kitty + complete setup bash)
eval "$(starship init bash)"

# make dir and cd in it
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }




