# Create a new built-in bash function : 1674413603
function new-function() {
  [[ $# == 1 ]] \
    && sudo nvim +3 /etc/profile.d/$1.sh \
    || sudo nvim +5 /etc/profile.d/
}

alias nf='new-function'
