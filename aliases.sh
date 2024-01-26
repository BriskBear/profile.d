# System-Wide Aliases : 1706231398
alias SVC='sudo systemctl'
alias cat='$PAGER'
alias l='ls -F'
alias ls='exa'
alias lsblk='lsblk -o LABEL,NAME,FSUSED,FSUSE%,FSAVAIL,SIZE,TYPE,FSTYPE,MOUNTPOINTS,UUID'
alias lsu='ls /media/usb/0'
alias pd='pushd'
alias q='exit'
alias rm='rm -v'
alias rs='reset ; printf "\033[1B\033[38;5;30m\e[3m     # Shell Reloaded\e[0m\033[0m\033[22D\033[2A" ; source /etc/profile'                # Reload the profile efficiently
alias sv='sudo XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim' # Edit as root with config
alias xo='xdg-open'

# Profile things
alias ea='nf aliases'

# Rails stuff
alias rced='rails credentials:edit --environment development'

# Rsync defaults
alias rsync='rsync -ahAX --info=progress2'

# AppImages
alias onenote='/opt/AppImage/P3X-OneNote-2020.4.185-i386.AppImage &>/tmp/onenote.log &'
