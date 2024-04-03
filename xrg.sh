# Call multi-threaded operations assuming % as replacment char : 
function xargs-percent() {
  xargs -I % "${@}"
}

alias xrg='xargs-percent'
