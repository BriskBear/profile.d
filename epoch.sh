# Get / Convert Epoch time : 1689333700
function epoch() {
  [[ $# == 1 ]] \
    && date --date=@$1 \
    || date -u +%s
}
