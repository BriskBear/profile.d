# Just a spinner to indicate activity : 1718251167
function spinner() {
  sym=( '|' '/' '-' '\' )
  $@ &>> /tmp/spinner.log &
  pid=$!

  idx=0
  while [ -d /proc/$pid ]
  do
    echo -ne " ${sym[$idx]}"
    sleep 0.3
    idx=$((($idx + 1) % 3 ))
    echo -ne "\033[2D"
  done
}
