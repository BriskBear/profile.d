# If a directory exists list contents and pushd there : 1687876959
function ls_pushd() {
  children=($(ls $@))
  [[ -z $children ]] || pushd ${@: -1}
  echo "${children[@]}" 
}

alias lsd='ls_pushd'
