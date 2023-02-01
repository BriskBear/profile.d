# FindOrCreate Tmux session with hostname : 1674413748
function enter-tmux() {
  [[ $(tmux ls 2>&1 |grep 'no server\|no sessions') ]] \
    && tmux new -s $HOSTNAME \
    || tmux attach 2> /dev/null
}

enter-tmux 2>&1 > /dev/null
