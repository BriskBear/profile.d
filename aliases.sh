# Persisant aliases for every bash session : 1698681047
  alias bat='batcat'
  alias EAL='sudo $EDITOR /etc/profile.d/aliases.sh'
  alias SVC='sudo systemctl'
  alias la='exa -Fa'
  alias ll='exa -Fal'
  alias ls='exa -F'
  alias lsblk='lsblk -o LABEL,NAME,FSTYPE,RO,TYPE,FSUSED,SIZE,MOUNTPOINT'
  alias nf='$EDITOR $XP/'
  alias pd='pushd'
  alias q='exit'
  alias rm='rm -v'
  alias rs='clear ; printf "\033[1B\033[38;5;30m\e[3m     # Shell Reloaded\e[0m\033[0m\033[20D\033[2A" ; source /etc/profile' # Reload the profile efficiently
  alias sv='sudo XDG_CONFIG_HOME=$XDG_CONFIG_HOME nvim' # Edit as root with config
  alias tal='exa -FaglTL'
  alias tree='exa -FT'
  alias xrg='xargs -I %'

# Quick move
  alias ..='cd ..'
  alias fgit='git clone --depth 1' # Shallow clone

# Rails stuff
  alias rced='rails credentials:edit --environment development'
