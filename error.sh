# Send a red error message and return 1 : 1674419159
function error() {
  msg="\033[1;31m$1\033[0m"
  [[ $# == 2 ]] && code=$2 || code=1
  echo -e $msg && return $code
}
