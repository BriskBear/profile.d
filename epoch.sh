# Get / Convert Epoch time : 
function epoch() {
  [[ $# == 1 ]] \
    && date --date=@$1 \
    || date -u +%s
}
