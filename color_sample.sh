# sample terminal 256-colors : 1689333689
function color_sample() {
  numbers=( $(seq 0 256) )
  lead="\u001b[38;5;"
  nc="\u001b[0m"

  for c in ${numbers[@]}
  do
    printf "$lead${c}m$c$nc"
    [[ $c -lt 10 ]] && printf " "
    [[ $c -lt 100 ]] && printf " "
    [[ $( echo "$c % 16"|bc ) -eq 0 ]] && printf "\n" || printf " "
  done
}
