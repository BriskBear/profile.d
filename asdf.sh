# Source essential asdf functions : 1698265058
export ASDF_DIR=/asdf
. /opt/asdf/asdf.sh
. /opt/asdf/completions/asdf.bash

function asdf_install_latest() {
  [[ $(asdf plugin list|grep $1) ]] || asdf plugin-add $1
  last=$(asdf list-all $1|grep -x '[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+'|tail -n1)
  asdf install $1 $last
  asdf global $1 $last
}
