# Call multi-threaded operations assuming % as replacment char : 1689333776
function xargs-percent() {
  xargs -I % "${@}"
}

alias xrg='xargs-percent'
