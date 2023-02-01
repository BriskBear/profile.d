# Shortcuts for ssh commands : 1675136703
ssh-get-keys() {
  read -p 'URL to copy public keys: '
  curl -#L $REPLY >> $HOME/.ssh/authorized_keys
}

ssh-init() {
  branch=$HOME/.ssh
  mkdir -pm 700 $branch/config.d
  echo "# Public Keys with access to this account : " > $branch/authorized_keys
  echo "include config.d/*" > $branch/config
  chmod 600 $branch/config $branch/authorized_keys
  ssh-get-keys
}

ssh-new() {
  declare -A props
  props=(
    ["host"]='Target Hostname/ip: '
    ["nick"]='Nickname (FileName): '
    ["port"]='Alternate Port: '
    ["altid"]='Alternate User: '
    ["idleaf"]='Identity File: '
  )

  for p in "${!props[@]}"
  do
    read -p "${props[$p]}" $p
  done

  [[ -z ${host} ]]
  [[ -z ${nick} ]]
}
