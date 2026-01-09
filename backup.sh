function bak() {
  WRK=`mktemp -d`

  local OPTIND OPTARG opt flags
  local target="$1"

  while getopts 'hb:r' in $opt
  do
    case "$opt" in
      b) BAK_DIR=$OPTARG ;;
      h) __backup_usage ; return 0 ;;
      r) flags+='--remove-files' ;;
      *) __backup_usage ; return 1 ;;
    esac
  done

  # Quit with usage if the target is neither file nor directory
  if [[ ! -d "$target" ]] && [[ ! -f "$target" ]]
  then __backup_usage ; return 1
  fi

  # Set+Create BAK_DIR if unset/nonexist
  export BAK_DIR=${BAK_DIR:=$HOME/.bak}
  [[ -d "$BAK_DIR" ]] || mkdir -pv "$BAK_DIR"

  local stub=`__trim_extenstion "$target"`
  local interm="$WRK/$stub.txz"
  local out_file="$BAK_DIR/$stub.tar"

  # Create the intermediate tarchive - xz9
  tar cJf "$interm" "$target" ${flags[@]}
  cksum=`__get_md5 "$interm"`
  mv "$interm" "$WRK/$cksum"

  # Append / create the backup file
  if [[ -f "$out_file" ]]
  then tar -rf "$out_file" -C "$WRK" "$cksum" --remove-files
  else tar -cf "$out_file" -C "$WRK" "$cksum" --remove-files
  fi

  # Cleanup
  rm -rf $WRK 2>&1>/dev/null
  unset cksum interm out_file stub target WRK
}

function select-restore() {
  local IFS=$'\n'
  local list=(`tar tivf ${1}`)

  printf "\e[38;5;28mChoose a file to restore: \e[0m\n"
  for vdx in $(seq ${#list[@]})
  do
    printf "\e[38;5;226m${vdx}\e[0m ${list[$((vdx -1))]}\n"
  done

  read -p '#: '

  local selection=`printf ${list[$((REPLY - 1))]} | awk '{print $NF}'`

  tar xfO "$1" "$selection" | tar xJvf -

  unset IFS list selection
}

function __backup_usage() {
  cat << ":"
Usage: backup [-b <backup_directory>] [-h] [-r] <target>
  Highly compresses a file / directory and adds it to an appropriate tar in the backup directory

  -b <backup_directory> Set and alternate backup directory, defaults to $BAK_DIR OR $HOME/.bak
  -h Display this help text
  -r Remove the backup target after backing up
:
}

function __get_md5() {
  md5sum "$1" | awk '{print $1}'
}

function __trim_extenstion() {
  printf "$1" | sed 's/\..\+$//g'
}
