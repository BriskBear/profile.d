# Who can remember all of these conversion ratios anyway : 
function celcius-to-fahrenheit() {
  echo "$1 * 9 / 5 + 32"|bc
}

function fahrenheit-to-celcius() {
  echo "($1 - 32) * 5 / 9"|bc
}

alias c2f='celcius-to-fahrenheit'
alias f2c='fahrenheit-to-celcius'
