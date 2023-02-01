# Persisant aliases for every bash session : 1675279889
  alias EAL='sudo $EDITOR /etc/profile.d/aliases.sh'
  alias SVC='sudo systemctl'
  alias q='exit'
  alias rs='reset && source /etc/profile'
  alias sv='sudo $EDITOR'
  alias xrg='xargs -I %'
  alias ls='exa -F'
  alias la='exa -Fa'
  alias ll='exa -Fal'
  alias tree='exa -FT'
  alias tal='exa -FaglTL'

  # Package Manager
  alias purge='sudo pacman -Rcc'
  alias setup='sudo pacman -S --noconfirm'
  alias update='sudo pacman -Scc --noconfirm && sudo pacman -Syyu --noconfirm'
  alias clean='sudo pacman -Scc'

  # Quick move
  alias ..='cd ..'
  alias fgit='git clone --depth 1' # Shallow clone
