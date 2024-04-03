# Whereis returns your argument annoyingly, so this strips that for just an array of the results : 
function whereis-usable() {
  grab=($( whereis $1 ))

  echo "${grab[@]:1}"
}

alias wheres='whereis-usable'
