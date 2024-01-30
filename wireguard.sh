# Wireless and VPN tools : 

function check-net() {
  [[ $(ping -c 1 1.1.1.1 2>/dev/null) =~ 'ttl=' ]] \
    && reply -i "Internet Accessible" \
    || reply -e "No Network"
}

function ip-global() {
  echo -e "Global IP: \033[38;5;34m$(curl ifconfig.me 2>/dev/null)\033[0m"
}

function connect-wireless(){
  sudo iwctl station wireless0 connect ${@:-BUTZ}
}

function reset-net() {
  daemons=( iwd dhcpcd )
  stop='sudo systemctl stop'
  start='sudo systemctl start'
  
  # Stop affor-listed network daemons
  for d in ${daemons[@]}
  do
    `$stop $d`
  done

  # Give daemons time to cleanup
  sleep 1

  # Start affor-listed network daemons
  for d in ${daemons[@]}
  do
    `$start $d`
  done

  # Call the 'connect function'
  connect-wireless
}

alias ipg='ip-global'
alias wifi='connect-wireless'
