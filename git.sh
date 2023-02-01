# Git shortcuts large and small : 1675284111
# Basics 
alias GP='git push'
alias ga='git add'
alias gck='git checkout'
alias gd='git diff'
alias gits='git status -sb'
alias gl='git log'
alias gp='git pull'
alias gs='git show'
alias gst='git stash'

function git-init() {
  RM=README.md
  [[ -f $RM ]] || echo '# README' > $RM

  git init 
  git add .
  git commit -m 'Initial Commit'
  read -p 'Remote Origin URL: ' && git remote add origin $REPLY
}
