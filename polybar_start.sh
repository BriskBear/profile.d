# (re)start polybar : 
function polybar-start() {
  [[ $(ps -ae|grep polybar) ]] && killall polybar
  polybar
}
