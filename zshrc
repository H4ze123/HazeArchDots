##
## ZSHRC
## Created by : @GeodeArc
##

# Will add more later

export EDITOR=nvim

# zsh history 
# i decided to combine with bash history, but you can change this if you like
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# GENERAL
alias c="clear"
alias nf="fastfetch"
alias pf="pfetch"
alias ff="fastfetch"
alias ls="eza --icons"
alias la="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=2 --icons"
alias shutdown="systemctl poweroff"
alias wifi="nmtui"
alias h="htop"
alias b="btop"
alias m="micro"
alias e="yazi"
alias clear="clear && fastfetch --logo-type small"
alias shutdown="shutdown -P now"
alias image="termvisage"
alias l="eza --icons"

# GIT
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gchk="git checkout"
alias gcred="git config credential.helper store"

# UTILS
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# OTHER
alias update="paru && flatpak upgrade"
alias x="exit"
alias yeet="paru -Rcns"
alias remove="paru -Rns"

eval "$(starship init zsh)"
if [[ $(tty) == *"pts"* ]]; then
   fastfetch --logo-type small
else
    echo
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi

# Created by `pipx` on 2025-05-21 10:59:48
export PATH="$PATH:/home/haze/.local/bin"
