# Reset readline and re-load profile : 1675281743
function restart-shell() {
  reset
  source /etc/profile
}

alias rs='restart-shell'
