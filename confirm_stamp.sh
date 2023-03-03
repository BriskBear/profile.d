# Source a properly-timestamped file : 1677880717
function confirm-stamp() {
  modified=$(stat -c %Y "$1")
  timestamp=$(head -n 1 "$1"|awk -F ': ' '{print $NF}')
  [[ $modified == $timestamp ]] \
    && source "$1" \
    || echo -e "\033[0;31mInvalid timestamp: $1\033[0m"
}
