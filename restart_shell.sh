# Reset readline and re-load profile : 1689333743
function restart-shell() {
  reset
  source /etc/profile
}

alias rs='restart-shell'
