#
# ~/.zshrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# initialize atuin
eval "$(atuin init zsh)"

# print system information
neofetch

# set editor as neovim
export EDITOR=nvim

# turn off vim mode
bindkey -e

# set delete key to delete
bindkey '^[[3~' delete-char

# set aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias git-clone-all="git branch -r | grep -v '\->' | while read remote; do git branch --track \"\${remote#origin/}\" \"\$remote\"; done"
alias update="sudo pacman -Syu && paru"
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias update-package-list="pacman -Qqne > $HOME/mhome/coding/bash/bash_scripts/install_scripts/arch_linux/laptop/packages/pacman;\
    pacman -Qqme > $HOME/mhome/coding/bash/bash_scripts/install_scripts/arch_linux/laptop/packages/aur"
alias polkit="/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

# make cd command to go to mhome
cd(){ builtin cd "${1-$HOME/mhome}" "${@:2}"; }
# if the current directory is home on terminal startup, go to mhome
if [[ "$PWD" == "$HOME" ]];
then
    cd
fi

PS1='[\u@\h \W]\$ '

# initialize thefuck
eval $(thefuck --alias)
# initialize cargo
. "$HOME/.cargo/env"

# initialize starship
eval "$(starship init zsh)"

autoload -U compinit; compinit
