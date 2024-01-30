# Create a new built-in bash function : 
function new-function() {
  [[ $# == 1 ]] \
    && sudo -i nvim +3 /etc/profile.d/$1.sh \
    || sudo -i nvim +5 /etc/profile.d/
}

alias nf='new-function'
