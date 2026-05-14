# System-Wide Aliases : 
alias :e='$EDITOR'
alias SVC='sudo systemctl'   # Manage System Services
alias UVC='systemctl --user' # Manage User Services
alias cat='$PAGER'    # Invoke Default pager
alias ea='nf aliases' # Edit profile-aliases (this file)
alias l='exa -F'      # List Files with type-indicators
alias la='exa -Fa'    # ^ Same, include hidden
alias ll='exa -galF'  # ^ Same list-format with groups
alias ls='exa -F'     # Use exa instead of ls
alias lsblk='lsblk -o LABEL,NAME,FSAVAIL,FSUSE%,SIZE,FSTYPE,TYPE,MOUNTPOINT,UUID'
alias lsu='ls /media/usb/0' # List dirs in the standard usb-mount point
alias pd='pushd' # Shortcut for pushd
alias q='exit' # Quickly exit
alias rm='rm -v' # Say what you're deleting
alias rsync='rsync -ahAX --info=progress2' # Default rsync options
alias sv='sudo -i $EDITOR' # Edit as root with config
alias tal='exa -F -aglTL' # Tree with symbols+groups+hidden specify how deep
alias tree='exa -TF' # Tree with symbols, full depth
alias xmm='xmodmap $XH/i3/Xmodmap' # Reload i3 keyboardmap
alias xo='xdg-open' # Shortcut to open a file with default application
alias xrg='xargs -I %' # xargs multi-threading using % as the replacer

# Quick move
alias fgit='git clone --depth 1' # Shallow clone

# Rails stuff
alias rced='rails credentials:edit --environment development'
