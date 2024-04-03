# Quickly scan a network for connected hosts : 
function qnmap() {
  subnet=`echo "$1"|awk -F'/' '{print $1}'`
  mask=`echo "$1"|awk -F'/' '{print $2}'`
  sudo nmap -sn -T5 --min-parallelism 126 ${subnet:-10.0.0.1}/${mask:-24}|sed 's/^Nmap/\r\nNmap/g'
}
