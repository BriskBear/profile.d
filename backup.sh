# Backup file/directory target : 
. $HOME/.local/etc/profile.d/01reply.sh

export BACKUP_DIR=${BACKUP_DIR:-$HOME/data/.bak}

function sum-target() { md5sum "$1" | awk '{print $1}' ; }

function create-backup() {
  echo "Creating new backup..." | tee -a "$log"

  case "$node" in
    'directory')
      create-branch-backup
      ;;
    'regular file')
      create-leaf-backup
      ;;
    *)
      echo "Only directories and regular files are supported"
      ;;
  esac
}

function create-branch-backup() {
  compress-branch

  tar cJfC "${buf}" ${wrk} "${md5}"  # Add the summed-backup to the versioned-backup
}

function compress-branch() {
  # Remove the .git tracking dir (don't need a million backups of this)
  if [[ -d "${path}/${mark}/.git" ]]
  then
    pushd "${path}/${mark}" 2>&1            >> "$log"
      git remote -v                         >> "$log"    # Log the git remote before cleanup
    popd 2>&1                               >> "$log"
    mv "${path}/${mark}/.git" "${path}/git" >> "$log"
  fi

  tar cJfC "${wrk}/${mark}.txz" ${path} ${mark}          # Compress the directory into the working (RAM) directory

  md5=`sum-target "${wrk}/${mark}.txz"`                  # Get the MD5 of the compressed directory

  mv -v "${wrk}/${mark}.txz" "${wrk}/${md5}" >> "$log"   # Rename the compressed folder as its MD5
  [[ -d "${path}/git" ]] && mv "${path}/git" "${path}/${mark}/.git" >> "$log"
}

function create-leaf-backup() {
  md5=`sum-target ${path}/${mark}`

  cp -v "${path}/${mark}" "${wrk}/${md5}" >> "$log"
  tar cJfC "${buf}" ${wrk} ${md5}
}

function split-path() {
  full_name=`realpath "$1" 2>/dev/null` || reply -e "Please supply a file:\n backup <directory|file>"
  log="${BACKUP_DIR}/`date -d "today 0" -u +%s`_backup.log"
  mark=`echo ${full_name} | awk -F/ '{print $NF}'`
  node=`stat --printf=%F ${full_name}`
  path="${full_name%/$mark}"
  wrk=${wrk:-`mktemp -d`}

  [[ -d ${BACKUP_DIR} ]] || mkdir -pv ${BACKUP_DIR} >> "$log"
}

function update-backup() {
  echo "Updating existing backup..." | tee -a "$log"

  xz -d "${buf}" -c > "${wrk}/${mark}.tar"  # Decompress tar archive (appendable)
  [[ $node == 'directory' ]] && compress-branch || md5=`sum-target "${path}/${mark}"`  # Compress the target directory and get MD5
  tar rf "${wrk}/${mark}.tar" -C "${wrk}" "${md5}"
  xz -ez -9 "${wrk}/${mark}.tar" -c > "${buf}"
}

function backup() {
  split-path "$1"  # Set local environment

  buf="${BACKUP_DIR}/.${mark}.txz"  # 

  echo " === `date` === " >> "$log"

  # Create / Update the backup
  if  [[ -f "${buf}" ]]
  then update-backup
  else create-backup
  fi

  # Cleanup
  rm -rvf "${wrk}"     >> "$log"
  echo " === END === " >> "$log"
  unset buf full_name log mark md5 node path wrk
}

function rn-sum() {
  sum=`md5sum "$1" | awk '{print $1}'`

  mv -v "$1" "${sum}"
}

function select-restore() {
  IFS=$'\n'
  list=(`tar tivf ${1}`)  
  # name=`sed "s/\..+$//g"`

  echo -e "[38;5;28mChoose a file to restore: [0m"
  for idx in $(seq ${#list[@]})
  do
    echo -e "  [38;5;226m${idx})[0m ${list[$(( idx - 1 ))]}"
  done

  read -p '#: '

  selection=`echo ${list[$(( $REPLY - 1 ))]} | awk '{print $NF}'`

  tar xfO "${1}" "${selection}"| tar xJvf -

  unset IFS
}
