#!/bin/bash

# Prep Loader
function check_stamp() { 
  modified=$(stat -c %Y "$1")
  timestamp=$(head -n 1 "$1"|awk -F': ' '{print $NF}')

  [[ $modified == $timestamp ]] \
    && source "$1"              \
    || printf "\033[0;31mStamp-check Failed: Not sourcing $1\033[0m\n"
}

# Load profiles from /etc/profile.d
if test -d $HOME/.local/etc/profile.d/; then
  for profile in $HOME/.local/etc/profile.d/*.sh; do
    test -r "$profile" && check_stamp "$profile"
  done

  unset profile
fi
