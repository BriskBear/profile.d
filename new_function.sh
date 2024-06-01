# Create a new built-in bash function : 
function new-function() {
  [[ $# == 1 ]] \
    && nvim +3 $HOME/.local/etc/profile.d/$1.sh \
    || nvim +5 $HOME/.local/etc/profile.d/
}

alias nf='new-function'
