# add ~/.local/bin to path
export PATH="/home/konji/.local/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name zsh theme
ZSH_THEME="robbyrussell"

# red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(
    git
    rust
    sudo
    )

source $ZSH/oh-my-zsh.sh

# start uwsm selector automatically to quickly start graphical session
if [[ $TMUX = "" ]] && [[ $(grep -i Microsoft /proc/version) = "" ]] && uwsm check may-start -q && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

# print system information if not in tmux
if [[ $TMUX = "" ]]; then
    neofetch
fi

# set editor and manpager as neovim
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# set aliases
alias git-clone-all="git branch -r | grep -v '\->' | while read remote; do git branch --track \"\${remote#origin/}\" \"\$remote\"; done"
alias update-package-list="pacman -Qqne > $HOME/mhome/coding/bash/install_scripts/arch_linux/laptop/packages/pacman;\
    pacman -Qqme > $HOME/mhome/coding/bash/install_scripts/arch_linux/laptop/packages/aur"
alias chafa="TERM=xterm-ghostty chafa"

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


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/konji/.opam/opam-init/init.zsh' ]] || source '/home/konji/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
