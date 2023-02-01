# (re)start polybar : 1674681760
function polybar-start() {
  [[ $(ps -ae|grep polybar) ]] && killall polybar
  polybar
}
