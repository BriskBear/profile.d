# TMUX Shortcuts, Attach creates the session if it does not exist : 1762971281
tmux-attach() {
  session="$1"
  
  [[ ! -n $session ]]          \
    && tmux attach &>/dev/null \
    || ( tmux attach -t "$session" &>/dev/null || tmux new-session -s "$session" &>/dev/null)
}

function _tmux-attach_completion() {
  SESSIONS=(`tmux ls | awk -F':' '{print $1}'`) 

  COMPREPLY=(`compgen -W "${SESSIONS[*]}" "${COMP_WORDS[1]}"`)
}

alias ta='tmux-attach'
alias txl='tmux ls'

complete -F _tmux-attach_completion tmux-attach
complete -F _tmux-attach_completion ta
