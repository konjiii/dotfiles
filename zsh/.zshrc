# add binary directories to path
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name zsh theme
ZSH_THEME="robbyrussell"

# red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(
    rust
    sudo
)

source $ZSH/oh-my-zsh.sh

# # start uwsm selector automatically to quickly start graphical session
# if [[ $TMUX = "" ]] && [[ $(grep -i Microsoft /proc/version) = "" ]] && uwsm check may-start -q && uwsm select; then
#     exec systemd-cat -t uwsm_start uwsm start default
# fi

# print system information if not in tmux
if [[ $TMUX = "" ]]; then
    fastfetch
fi

# set some env variables
export EDITOR=nvim
export MANPAGER='nvim +Man!'
# -R: retain colors
# -F: quit if the content fits on one screen
# -X: do not clear the screen after exit
export LESS="-R -F -X"

# set aliases
alias update-package-list="pacman -Qqne > $HOME/mhome/coding/bash/install_scripts/arch_linux/laptop/packages/pacman;\
    pacman -Qqme > $HOME/mhome/coding/bash/install_scripts/arch_linux/laptop/packages/aur"
alias chafa="TERM=xterm-ghostty chafa"
alias update="\
    echo '\n==============================';\
    echo 'Updating pacman packages...';\
    echo '==============================';\
    sudo pacman -Syu;\
    echo '\n==============================';\
    echo 'Updating AUR packages...';\
    echo '==============================';\
    paru -Syu;\
    echo '\n==============================';\
    echo 'Updating uv tools...';\
    echo '==============================';\
    uv tool upgrade --all;\
    echo '\n==============================';\
    echo 'Updating cargo packages...';\
    echo '==============================';\
    cargo install-update -a;\
    echo '\n==============================';\
    echo 'Updating flatpak packages...';\
    echo '==============================';\
    flatpak update -y;\
    echo '\n==============================';\
    echo 'Updating go packages...';\
    echo '==============================';\
    gup update;\
    echo '\n==============================';\
    echo 'Updating rust toolchain';\
    echo '==============================';\
    rustup self update;\
    rustup update\
    "

# make cd command to go to mhome
cd(){ builtin cd "${1-$HOME/mhome}" "${@:2}"; }
# if the current directory is home on terminal startup, go to mhome
if [[ "$PWD" == "$HOME" ]];
then
    cd
fi

# initialize cargo
. "$HOME/.cargo/env"

autoload -U compinit; compinit

# fzf functionality
source <(fzf --zsh)

# uv completion
source <(uv generate-shell-completion zsh)

# source sensitive variables
source "/home/konji/.secrets.env"

# disable exit using ctrl-D
set -o ignoreeof

# pnpm
export PNPM_HOME="/home/konji/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:/home/konji/.modular/bin"
