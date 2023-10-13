# System-Wide Aliases : 1697216095
alias rs='reset ; source /etc/profile'                # Reload the profile efficiently
alias sv='sudo XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim' # Edit as root with config
alias lsblk='lsblk -o LABEL,NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS'

# Rails stuff
alias rced='rails credentials:edit --environment development'
