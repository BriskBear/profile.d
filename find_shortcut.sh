# Find where the shortcut is to review / update it : 
shortcuts=(
  $XP
)

function find-shortcut() {
  printf '%s\n' ${shortcuts[@]}|
   xargs -I % ag " $1" % --hidden --color|
    sed -e 's/\s\+/ /'|
     sed -e 's/\#/\n\# /'
}

alias ?='find-shortcut'
