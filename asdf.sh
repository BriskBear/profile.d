# Source essential asdf functions : 1689358340
. /opt/asdf/asdf.sh
. /opt/asdf/completions/asdf.bash

function asdf_install_latest() {
  last=$(asdf list-all $1|ag '^\d+\.\d+\.\d+$'|tail -n1)
  asdf install $1 $last
  asdf global $1 $last
}
