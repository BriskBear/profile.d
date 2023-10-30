# Call the appropriate package manager for your distro with unified verbiage : 1698689256

declare -A clean
declare -A purge
declare -A setup
declare -A update 
declare DISTRO

CLEAN["arch"]='pacman -Scc'
PURGE["arch"]='pacman -Rcc'
PURGE["ubuntu"]='apt purge'
SETUP["arch"]='pacman -S --noconfirm'
SETUP["ubuntu"]='apt-get install -y'
UPDATE["arch"]='sudo pacman -Scc --noconfirm ; sudo pacman -Syu --noconfirm'
UPDATE["ubuntu"]=ubuntu_update

function ubuntu_update() {
  sudo apt update
  sudo apt upgrade -y
}

function package() {
  [[ -n $DISTRO ]] \
    && ( export DISTRO=$( cat /etc/*{release,version} 2>/dev/null|grep -e '^ID='|awk -F= '{print $NF}' ))
  unset -v call command

  call=$(echo $1|tr '[:lower:]' '[:upper:]')
  reply -i "call: $call"
  case $call in
    CLEAN)
        command=${CLEAN[$DISTRO]}
      ;;
    PURGE)
        command=${PURGE[$DISTRO]}
      ;;
    SETUP)
        command=${SETUP[$DISTRO]}
      ;;
    UPDATE)
        ${UPDATE[$DISTRO]}
      ;;
    *)
      reply -w "Package currently only supports: <clean|purge|setup|update>"
      ;;
  esac

  sudo $command ${*:2} 2>&1 >>/tmp/package_manager.log
}

alias clean='package clean'
alias purge='package purge'
alias setup='package setup'
alias update='package update'
