# Quickly search the entire disk for a file : 
slick_search() {
  [[ $1 ]] && srchstr="$1" || return 1
  ls /                                            |
   ag -v '^mnt|^media|^dev|^proc|^sys|\.git'      |
   xargs -I % sudo find /% "$srchstr" 2>/dev/null |
   ag $srchstr
}

alias sfind='slick_search'
