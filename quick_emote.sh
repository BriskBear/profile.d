# Quickly copy emoji : 

function quick-emote() {
  emoji=(
    '¯\_(ツ)_/¯'
  )

  echo "${emoji[$1]}"|xclip -sel clip
}

alias shrug='quick-emote 0'
