# Decrypt keepass password to clipboard, clear after 5 seconds : 
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
  by_signingKey=$(git config --global user.signingkey)
  default_key=$(gpg -K --keyid-format=long|ag -B1 $by_signingKey|head -n1|awk -F'\\(|\\)' '{print $2}')

  reply "Encrypting with: $default_key"

  [[ -d $cred_dir ]] || mkdir -vp $cred_dir
  read -sp "$1: "
  printf $REPLY |
    gpg -a -se -r $default_key -o $cred_dir/$1
}

# alias tok='clipkey Token.asc'
