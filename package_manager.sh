# Call the appropriate package manager for your distro with unified verbiage : 
declare DISTRO

if [[ -z $DISTRO ]]
then export DISTRO=$( cat /etc/*{release,version} 2>/dev/null|grep -e '^ID='|awk -F= '{print $NF}' )
fi

case $DISTRO in
  arch)
    . $XP/package_manager/pacman.sh
    ;;
  *)
    reply -e "$DISTRO not yet supported: $XP/package_manager.sh ln:13"
    ;;
esac
