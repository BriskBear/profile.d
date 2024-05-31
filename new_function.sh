# Create a new built-in bash function : 
function new-function() {
  [[ $# == 1 ]] \
    && nvim +3 /etc/profile.d/$1.sh \
    || nvim +5 /etc/profile.d/
}

alias nf='new-function'
