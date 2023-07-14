# Whereis returns your argument annoyingly, so this strips that for just an array of the results : 1689333771
function whereis-usable() {
  grab=($( whereis $1 ))

  echo "${grab[@]:1}"
}

alias wheres='whereis-usable'
