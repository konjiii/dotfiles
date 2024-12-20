#
# ~/.zshrc
#
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# start uwsm selector automatically to quickly start graphical session
if [[ $TMUX = "" ]] && uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

# initialize atuin
eval "$(atuin init zsh)"

# print system information if not in tmux
if [[ $TMUX = "" ]]; then
    neofetch
fi

# set editor and manpager as neovim
export EDITOR=nvim
export MANPAGER='nvim +Man!'

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

eval "$(pyenv init -)"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/konji/.opam/opam-init/init.zsh' ]] || source '/home/konji/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
