# Just a spinner to indicate activity : 
function spinner() {
  sym=( '|' '/' '-' '\' )
  $@ &>> /tmp/spinner.log &
  pid=$!

  while [ -d /proc/$pid ]
  do
    for s in ${sym[@]}
    do
      echo -e "\033[1A\033[0K $s"
      sleep 0.3
    done
  done
  echo -e "\033[2A\033[0K\nDONE!"
}
