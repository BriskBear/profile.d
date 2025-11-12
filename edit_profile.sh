# Create a new built-in bash function : 
function edit-profile() {
  [[ $# == 1 ]] \
    && nvim +3 $HOME/.local/etc/profile.d/$1 \
    || nvim +5 $HOME/.local/etc/profile.d/
}

function _edit-profile_completions() {
  PROFILES=(`find $XP | ag '\.sh$' | sed "s:$HOME/.local/etc/profile.d/::"`) 

  if [[ ${COMP_WORDS[0]} =~ ':' ]]
  then COMPREPLY=(`compgen -W "${PROFILES[*]}" "${COMP_WORDS[2]}"`)
  else COMPREPLY=(`compgen -W "${PROFILES[*]}" "${COMP_WORDS[1]}"`)
  fi
}

complete -F _edit-profile_completions edit-profile
alias :p='edit-profile'
complete -F _edit-profile_completions :p
