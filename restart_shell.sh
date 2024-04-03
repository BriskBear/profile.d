# Reset readline and re-load profile : 
function restart-shell() {
  reset
  source /etc/profile
}

alias rs='restart-shell'
