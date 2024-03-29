# Manage Containers : 1699045122

function box() {
  if [[ ! -n $container ]] 
  then
    export container=$(
      [[ -e $(which docker 2>/dev/null) ]] \
        && echo docker \
        || ([[ -e $(which podman 2>/dev/null) ]] \
              && echo podman
    ))
  fi

  sudo $container "$@"
}

function container-list() {
  export clist=($(box ps -a|tail -n +2|awk '{print $1}'))
  box ps -a "$@"
}

function image-list() {
  export ilist=($(box image list -a|tail -n +2|awk '{print $3}'))
  box image list -a
}

function container-search() {
  container-list|ag $1|head -n1|awk '{print $1}'
}

function image-search() {
  if [[ "$1" =~ ':' ]]  
  then
    name=$(echo $1|awk -F':' '{print $1}')
    vers=$(echo $1|awk -F':' '{print $2}')

    image-list|ag $name|ag $vers|awk '{print $3}'
  else
    image-list|ag $1|awk '{print $3}'
  fi
}

function box-search-stop() {
  box stop $(container-search $1)
}

function box-search-enter() {
  if [[ $# -eq 1 ]]
  then box exec -it $(container-search $1) bash
  else box exec -it $(container-search $1) ${@:2}
  fi
}

function box-remove() {
  [[ $# == 2 ]] && box "$1" rm -f "$2" \
    || error "Usage: box-remove <container|image> <id>\n  Wrong argument count: $#"
}

function box-search-rm() {
  box container rm $(container-search $1) "$2" 2>/dev/null
}

function box-search-run() {
  box run -h $1 --name $1 -d $(image-search $1|head -n1) tail -f /dev/null
}

function box-search-destroy() {
  box image rm $(container-list|ag $1|awk '{print $2}') "$2"
}

function box-remove-all() {
  case $1 in
    container)
      cl && println "${clist[@]}"|xrg box container rm -f %
      ;;
    image)
      il && println "${ilist[@]}"|xrg box image rm -f %
      ;;
    *)
      error "box cannot remove $1"
      ;;
  esac
}

function box-run-enter() {
  box-search-run   $1
  box-search-enter $1
}

alias bcp='box cp'
alias bcrm='box-remove container'
alias bcpr='box container prune'
alias bipr='box image prune'
alias birm='box-remove image'
alias brac='box-remove-all container'
alias brai='box-remove-all image'
alias brc='box-remove container'
alias bri='box-remove image'
alias bsd='box-search-destroy'
alias bse='box-search-enter'
alias bsr='box-search-run'
alias bsre='box-run-enter'
alias bsrm='box-search-rm'
alias bss='box-search-stop'
alias cl='container-list'
alias cs='container-search'
alias il='image-list'
alias is='image-search'
