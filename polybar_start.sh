# (re)start polybar : 1689333730
function polybar-start() {
  [[ $(ps -ae|grep polybar) ]] && killall polybar
  polybar
}
