# Call multi-threaded operations assuming % as replacment char : 1674413939
function xargs-percent() {
  xargs -I % "${@}"
}

alias xrg='xargs-percent'
