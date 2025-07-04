# Call the appropriate package manager for your distro with unified verbiage : 
declare DISTRO

if [[ -z $DISTRO ]]
then export DISTRO=$( cat /etc/*{release,version} 2>/dev/null|grep -e '^ID='|awk -F= '{print $NF}' )
fi

. $XP/package_manager/${DISTRO}.sh || reply -e "package_manager.sh:ln8: $DISTRO not yet supported"
