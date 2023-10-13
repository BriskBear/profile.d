# Refresh the pacman-keyring : 1685573498
function refresh-keys() {
  sudo rm -rf /etc/pacman.d/gnupg
  dirmngr < /dev/null

  pacman-key --init
  pacman-key --populate archlinux
  pacman-key --refres
}
