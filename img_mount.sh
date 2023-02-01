# Mount a VM image to loopback : 1675136241
function img-mount() {
  [[ $# == 1 ]] && leaf="$1" || error 'Usage: img-mount <path/to/file.img>'

  sudo losetup -fP $leaf
}
