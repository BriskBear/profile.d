# Just a spinner to indicate activity : 
function spinner() {
  sym=( '|' '/' '-' '\' )
  $@ &>> /tmp/spinner.log &
  pid=$!

  idx=0
  while [ -d /proc/$pid ]
  do
    echo -e "\033[0A\033[0K ${sym[$idx]}"
    sleep 0.3
    idx=$((($idx + 1) % 3 ))
  done
  echo -ne "\033[1A\033[0K\033[1A\033[0K"
}
