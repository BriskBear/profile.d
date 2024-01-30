# Source essential asdf functions : 
export ASDF_DIR=/opt/asdf
. /opt/asdf/asdf.sh
. /opt/asdf/completions/asdf.bash
[[ -d ${XDG_CONFIG_HOME}/asdf-direnv ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"

function asdf_install_latest() {
  [[ $(asdf plugin list|grep $1) ]] || asdf plugin-add $1
  last=$(asdf list-all $1|grep -x '[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+'|tail -n1)
  asdf install $1 $last
  asdf global $1 $last
}
