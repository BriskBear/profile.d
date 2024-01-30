# Bat manpages with nice framing : 
function man-bat() {
  man "$1" 2>/dev/null|bat --style=grid,header
}

alias doc='man-bat'
