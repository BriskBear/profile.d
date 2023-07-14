# Initialize ssh config directory : 1689333768
function ssh_init() {
  errColor="\u001b[38;5;160m"
  warnColor="\u001b[38;5;47m"
  nc="\u001b[0m"
  sshHome=$HOME/.ssh

  [[ -d $sshHome ]] \
    && ( echo -e "$errColor$sshHome exists, skipping creation$nc" && return 0 ) \
    || ( mkdir -pv $sshHome/config.d && echo 'Include config.d/*' > $sshHome/config )

  printf "Host github\n  Hostname github.com\n  User git" > $sshHome/config.d/github
}
