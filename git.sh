# Git shortcuts large and small : 
source /etc/profile.d/git-sh-prompt

function git-add-commit() {
  [[ $# -gt 0 ]] || return 1

  git diff $@
  echo -e "\u001b[38;5;3mCommit Message:\u001b[0m"
  read
  git add $@
  git commit -S -m "$REPLY" 
}

function git-clone-all() {
  og=$(echo $1|sed 's/gitlab-old://g')
  repo=$(echo $og|awk -F '/' '{print $NF}')

  mkdir -vp $repo
  git clone --mirror gitlab-old:$og $repo/.git
  pushd $repo
    git config --bool core.bare false
    git branch
  popd
}

function git-commit() {
  declare message="$@"
  
  git commit -m "$message"|ag --passthrough 'Aborting commit due to empty commit message.'
  git pull
  reply -i 'Unstaged Files: ' 0
  git status -s
  
  read -p 'Push changes? (y/n) '
  [[ $REPLY =~ 'y' ]] && git push
}

function git-diff-mod-loop() {
  count=$(($(git status -sb|wc|awk '{print $1}') - 1))
  mods=$(git status -sb|tail -n$count|grep -v '??'|awk '{print $2}')

  for l in ${mods[@]}
  do 
    git diff $l
    read -p "Add $l to commit? (y/n)" -d'' -s -n1
    echo
    [[ $REPLY == 'y' ]] && git add $l
  done
}

function git-init() {
  RM=README.md
  [[ -f $RM ]] || echo '# README' >> $RM

  git init
  git add . 
  git commit -m 'Initial Commit'
  read -p 'Remote Origin URL: ' && git remote add origin $REPLY && git push -u origin master
}

function git-push-full() {
  og=$(echo $1|sed 's/gitlab-old://g')
  repo=$(echo $og|awk -F '/' '{print $NF}')

  pushd $repo
    git push origin '*:*'
    git push origin --all
    git push origin --tags
  popd
}

function git-status-brief() {
  printf "${CYAN} Pulled at: ${NC}"
  stat -c %y .git/FETCH_HEAD
  git status -sb 2> /dev/null
  export gits=($(git status -sb 2>/dev/null|tail -n +2|awk '{print $2}'))
}

function git-us-remote() {
  og=$(echo $1|sed 's/gitlab-old://g')
  repo=$(echo $og|awk -F '/' '{print $NF}')

  pushd $repo
    git remote rename origin legacy
    git remote add origin gitlab:$og
  popd
}

alias GAC='git-add-commit'
alias GP='git push'
alias ga='git add'
alias gb='git branch'
alias gbr='git branch -r'
alias gc='git commit -S -m'
alias gca='git-clone-all'
alias gcam='git-commit'
alias gck='git checkout'
alias gcm='git commit -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gits='git status -sb'
alias gl='git log'
alias gp='git pull'
alias gpf='git-push-full'
alias gra='git remote add'
alias grr='git remote remove'
alias grv='git remote -v'
alias gs='git show'
alias gst='git stash'
alias gur='git-us-remote'
