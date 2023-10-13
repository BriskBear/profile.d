# Manage Distribution-specific packages : 1693326791
alias purge='sudo pacman -Rcc'
alias query='sudo pacman -Q'
alias setup='sudo pacman -S --noconfirm'
alias update='sudo pacman -Syyu'

clear_existing() {
  declare -A rp_string
  leaf=$1

  rp_string[0]='s/.\+: //g'
  rp_string[1]='s/ exists in filesystem//g'
  
  exist=($(cat $leaf|sed "${rp_string[0]}"|sed "${rp_string[1]}"))
  printf '%s\n' ${exist[@]}|xargs -I % sudo rm -rf %
}

install_wiki() {
  packages=($(echo "$@"|sed 's/\.//g'))
  
  setup ${packages[@]}
  query ${packages[@]}
}

alias Install='install_wiki'
