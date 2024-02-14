# Multithread your finds : 1676647821
function fast-find() {
  list=($(ls -A /))
  query="$1"
  out=/tmp/ag_$query

  [[ -f $out ]] && rm $out
  printf '%s\n' "${list[@]}"|xargs -I % sudo find /% 2>&1|ag -v '.git|Permission Denied'|ag $query --color &> $out
  echo -e "${RUST}Results in $out${NC}"
}

alias ffind='fast-find'
