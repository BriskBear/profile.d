# Source essential asdf functions : 1698265058
. /asdf/asdf.sh
. /asdf/completions/asdf.bash

function asdf_install_latest() {
  [[ $(asdf plugin list|grep $1) ]] || asdf plugin-add $1
  last=$(asdf list-all ruby|grep -x '[[:digit:]]\.[[:digit:]]\+\.[[:digit:]]\+'|tail -n1)
  asdf install $1 $last
  asdf global $1 $last
}
