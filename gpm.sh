# no GPG paste : 1674413547
case $( /usr/bin/tty ) in
    /dev/tty[0-9]*) [ -n "$(pidof -s gpm)" ] && /usr/bin/disable-paste ;;
esac
