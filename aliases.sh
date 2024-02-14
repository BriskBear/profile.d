# System-Wide Aliases : 
alias EAL='sudo $EDITOR /etc/profile.d/aliases.sh'
alias SVC='sudo systemctl'
alias SVC='sudo systemctl'
alias bat='batcat'
alias cat='$PAGER'
alias l='eza -F'
alias la='eza -Fa'
alias ll='eza -Fal'
alias ls='eza -F'
alias lsblk='lsblk -o LABEL,NAME,FSUSED,FSUSE%,FSAVAIL,SIZE,TYPE,FSTYPE,MOUNTPOINTS,UUID'
alias lsu='ls /media/usb/0'
alias nf='$EDITOR $XP/'
alias pd='pushd'
alias q='exit'
alias rm='rm -v'
alias rs='reset ; printf "\033[1B\033[38;5;30m\e[3m     # Shell Reloaded\e[0m\033[0m\033[22D\033[2A" ; source /etc/profile'  # Reload the profile efficiently
alias sv='sudo XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim' # Edit as root with config
alias tal='eza -FaglTL'
alias tree='eza -FT'
alias xo='xdg-open'
alias xrg='xargs -I %'

# Profile things
alias ea='nf aliases'
alias nf='$EDITOR $XP/'
alias pd='pushd'
alias q='exit'
alias rm='rm -v'
alias rs='reset ; source /etc/profile'                # Reload the profile efficiently
alias sv='sudo XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim' # Edit as root with config
alias tal='exa -FaglTL'
alias tree='exa -FT'
alias xrg='xargs -I %'

# Quick move
alias ..='cd ..'
alias fgit='git clone --depth 1' # Shallow clone

# Rails stuff
alias rced='rails credentials:edit --environment development'

# Rsync defaults
alias rsync='rsync -ahAX --info=progress2'
