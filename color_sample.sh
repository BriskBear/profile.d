# sample terminal 256-colors : 
function color-sample() {
  numbers=( $(seq 0 256) )
  lead="\u001b[38;5;16m\u001b[1;\u001b[48;5;"
  nc="\u001b[0m"

  for c in ${numbers[@]}
  do
    printf "$lead${c}m"
    [[ $c -lt 10 ]] && printf " "
    printf "$c"
    [[ $c -lt 100 ]] && printf " "
    [[ $( echo "$c % 16"|bc ) -eq 0 ]] && printf "$nc\n" || printf "$nc "
  done
}
