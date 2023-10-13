# Find where the shortcut is to review / update it : 1680216495
shortcuts=(
  ~/.io/config
  ~/.local/bin
  /etc/profile.d
)

function find_shortcut() {
  printf '%s\n' ${shortcuts[@]}|
   xargs -I % ag " $1" % --hidden --color|
    sed -e 's/\s\+/ /'|
     sed -e 's/\#/\n\# /'
}

alias ?='find_shortcut'
