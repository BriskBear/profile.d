# Print each entry of an array on its own line, uses [list] if no array given : 1689333733
println() {
  [[ $# > 0 ]] && printf '%s\n' "$@" || printf '%s\n' "${list[@]}"
}

alias setl='. set_list.sh'
