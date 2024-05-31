# Reset readline and re-load profile : 
function restart-shell() {
  reset 
  printf "\033[1B\033[38;5;30m\e[3m    # Shell Reloaded \e[0m\033[0m\033[22D\033[2A" 
  source $HOME/.profile' # Reload the profile efficiently
}

alias rs='restart-shell'
