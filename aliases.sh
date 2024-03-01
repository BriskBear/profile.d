# System-Wide Aliases : 
alias EAL='sudo $EDITOR /etc/profile.d/aliases.sh'
alias SVC='sudo systemctl'
alias cat='$PAGER'
alias ea='nf aliases'
alias l='eza -F'
alias la='eza -Fa'
alias ll='eza -galF'
alias ls='eza -F'
alias lsblk='lsblk -o LABEL,NAME,FSAVAIL,FSUSE%,SIZE,FSTYPE,TYPE,MOUNTPOINT,UUID'
alias lsu='ls /media/usb/0'
alias nf='$EDITOR $XP/'
alias pd='pushd'
alias q='exit'
alias rm='rm -v'
alias rs='reset ; printf "\033[1B\033[38;5;30m\e[3m    # Shell Reloaded \e[0m\033[0m\033[22D\033[2A" ; source /etc/profile' # Reload the profile efficiently
alias rsync='rsync -ahAX --info=progress2'
alias sv='sudo -i $EDITOR' # Edit as root with config
alias tal='eza -F -aglTL'
alias tree='eza -TF'
alias xmm='xmodmap $XH/i3/Xmodmap'
alias xo='xdg-open'
alias xrg='xargs -I %'

# Quick move
alias ..='cd ..'
alias fgit='git clone --depth 1' # Shallow clone

# Rails stuff
alias rced='rails credentials:edit --environment development'
