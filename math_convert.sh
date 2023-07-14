# Who can remember all of these conversion ratios anyway : 1689333718
function celcius_to_fahrenheit() {
  echo "$1 * 9 / 5 + 32"|bc
}

function fahrenheit_to_celcius() {
  echo "($1 - 32) * 5 / 9"|bc
}

alias c2f='celcius_to_fahrenheit'
alias f2c='fahrenheit_to_celcius'
