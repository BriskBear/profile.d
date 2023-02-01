# Manage Containers : 1675136685

podman-container-list() {
  export cpod=($(podman ps -a|tail -n +2|awk '{print $1}'))
  podman ps "$@"
}

podman-image-list() {
  export ipod=($(podman image list -a|tail -n +2|awk '{print $3}'))
  podman image list -a
}

podman-remove() {
  [[ $# == 2 ]] && podman "$1" rm -f "$2" \
    || error "Usage: podman-remove <container|image> <id>\n  Wrong argument count: $#"
}

podman-remove-all() {
  case $1 in
    container)
      pcl && println "${cpod[@]}"|xrg podman container rm -f %
      ;;
    image)
      pil && println "${ipod[@]}"|xrg podman image rm -f %
      ;;
    *)
      error "podman cannot remove $1"
      ;;
  esac
}

alias pcl='podman-container-list'
alias pcr='podman-remove container'
alias pcra='podman-remove-all container'
alias pil='podman-image-list'
alias pir='podman-remove image'
alias pira='podman-remove-all image'
