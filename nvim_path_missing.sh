# Create directories for the path and edit the file in nvim : 1689333723
function nvim-path-missing() {
  [[ -f "$1" ]] && return 1
  in="$1"
  leaf=$(echo $in|awk -F '/' '{print $NF}')
  branch=$(echo $in|sed "s/$leaf//g")

  mkdir -vp $branch && $EDITOR $leaf
}

alias nvdir='nvim-path-missing'
