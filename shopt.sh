# Global Default Bourne-Again Shell Behaviour : 1674413695
shopt -s expand_aliases
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
set -o vi
set editing-mode vi
set keymap vi
set show-mode-in-prompt on
set vi-ins-mode-string \1\e[6 q\2
set vi-cmd-mode-string \1\e[2 q\2
