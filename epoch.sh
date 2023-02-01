# Get / Convert Epoch time : 1674414252
function epoch() {
  [[ $# == 1 ]] \
    && date --date=@$1 \
    || date -u +%s
}
