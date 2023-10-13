# Decrypt keepass password to clipboard, clear after 5 seconds : 1696883656
function clipkey() {
  dunstify "ClipKey $1" -t 5000

  case "$1" in
    'QuickAssist')
      cat $HOME/.config/.cred/$1 2>/dev/null|xclip -sel clip
      ;;
    *)
      gpg -d $HOME/.config/.cred/$1 2>/dev/null|xclip -sel clip
      sleep 5
      xclip -sel clip /dev/null
      ;;
  esac
}

function lock_key() {
  if [ $# -ne 1 ]
  then
    reply -e 'Requires output file name'
    return 1
    exit 1
  fi
  cred_dir=$HOME/.config/.cred
  by_email=$(git config --global user.email)
  default_key=$(gpg -K|ag $by_email|tail -n1|awk -F'\\(|\\)' '{print $2}')

  reply "Encrypting with: $default_key"

  [[ -d $cred_dir ]] || mkdir -vp $cred_dir
  read -sp "$1: "
  printf $REPLY |
    gpg -a -se -r $default_key -o $cred_dir/$1
}

alias 3d='clipkey 3d'
alias bw='clipkey BitWarden'
alias git_token='clipkey Git-Container'
alias kp='clipkey KeePass'
alias pi='clipkey Sentinal'
alias pm='clipkey PassMark'
alias qa='clipkey QuickAssist'
alias ud='clipkey ud_admin.asc'
alias wdb='clipkey MySQL'
