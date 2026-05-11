# TMUX Shortcuts, Attach creates the session if it does not exist : 
function tmux-attach() {
  session="$1"
  
  [[ -z $session ]]                \
    && ( tmux attach &>/dev/null ) \
    || ( tmux new -As "${session:-`caps-host`}" )
}

function _tmux-attach_completion() {
  SESSIONS=(`tmux ls | awk -F':' '{print $1}'`) 

  COMPREPLY=(`compgen -W "${SESSIONS[*]}" "${COMP_WORDS[1]}"`)
}

function caps-host() {
	echo "$HOSTNAME" | tr [:lower:] [:upper:] | sed -e 's/I7//g' -e 's/10900K//g'
}

alias ta='tmux-attach'
alias txl='tmux ls'

complete -F _tmux-attach_completion tmux-attach
complete -F _tmux-attach_completion ta
