# Find folder on / with more than 1Gb : 
function cleanup-disk() {
  declare -a subs
  ls /
  big=`get-gig|awk '{print $NF}'`
  for dir in ${big[@]}
  do
    subs+=(`get-gig $dir|awk '{print $NF}'`)
  done

  for dir in ${subs[@]}
  do
    get-gig $dir
  done
}

function get-gig() {
  sudo du -hs "$1"/* 2>&1|ag -v '/tmp|cannot access'|ag '^\d+\.\d+G'
}
