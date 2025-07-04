#!/usr/bin/env bash
# package_manager shortcuts

export package_mgr=`which nala 2>/dev/null || which apt-get 2>/dev/null`

function ubuntu-update() {
   $doas $package_mgr update -y
   $doas $package_mgr upgrade -y
}

alias purge='$doas $package_mgr purge -y'
alias setup='$doas $package_mgr install -y'
alias update='ubuntu-update'
