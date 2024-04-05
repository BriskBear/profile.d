# Configure various applications : 
function configure() {
  declare -A config_file

  config_file["i3"]=$XH/i3/config
  config_file["dunst"]=$XH/dunst/dunstrc
  config_file["resolv"]=/etc/resolv.conf
  config_file["resolved"]=/etc/systemd/resolved.conf
  config_file["polybar"]=$XH/polybar/config.ini

  [[ ${!config_file[@]} =~ "$1" ]] || reply -e "$1 is not yet configured"

  sv ${config_file["$1"]}
}

alias cfg='configure'
