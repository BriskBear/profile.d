# System-Wide Aliases : 
alias EAL='sudo $EDITOR /etc/profile.d/aliases.sh'
alias SVC='sudo systemctl'
alias cat='$PAGER'
alias ea='nf aliases'
alias l='exa -F'
alias la='exa -Fa'
alias ll='exa -galF'
alias ls='exa -F'
alias lsblk='lsblk -o LABEL,NAME,FSAVAIL,FSUSE%,SIZE,FSTYPE,TYPE,MOUNTPOINT,UUID'
alias lsu='ls /media/usb/0'
alias nf='$EDITOR $XP/'
alias pd='pushd'
alias q='exit'
alias rm='rm -v'
alias rsync='rsync -ahAX --info=progress2'
alias sv='sudo -i $EDITOR' # Edit as root with config
alias tal='exa -F -aglTL'
alias tree='exa -TF'
alias xmm='xmodmap $XH/i3/Xmodmap'
alias xo='xdg-open'
alias xrg='xargs -I %'

# Quick move
alias ..='cd ..'
alias fgit='git clone --depth 1' # Shallow clone

# Rails stuff
alias rced='rails credentials:edit --environment development'
