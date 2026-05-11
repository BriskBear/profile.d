#!/bin/bash

# Add the local user path unless it exists
[[ $PATH =~ $HOME/.local/bin ]] || export PATH="$PATH:$HOME/.local/bin"

# Load profiles from /etc/profile.d
if test -d $HOME/.local/etc/profile.d/; then
  for profile in $HOME/.local/etc/profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done

  unset profile
fi

