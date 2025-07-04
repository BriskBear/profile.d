#!/usr/bin/env bash
# package_manager shortcuts
alias clean='$doas pacman -Scc'
alias purge='$doas apk del'
alias setup='$doas apk add'
alias update='$doas apk -U upgrade --available'
