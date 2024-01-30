# TMUX Shortcuts, Attach creates the session if it does not exist : 
tmux-attach() {
  session="$1"
  
  [[ ! -n $session ]] \
    && tmux attach &>/dev/null \
    || ( tmux attach -t "$session" &>/dev/null || tmux new-session -s "$session" &>/dev/null)
}

alias ta='tmux-attach'
alias txl='tmux ls'
