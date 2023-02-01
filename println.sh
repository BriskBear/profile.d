# Print each entry of an array on its own line, uses [list] if no array given : 1674420062
println() {
  [[ $# > 0 ]] && printf '%s\n' "$@" || printf '%s\n' "${list[@]}"
}
