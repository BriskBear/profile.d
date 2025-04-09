# Source essential asdf functions : 
export ASDF_DATA_DIR="$HOME/.local/share/asdf"

[[ $PATH =~ $ASDF_DATA_DIR/shims ]] || export PATH=$PATH:$ASDF_DATA_DIR/shims

. <(asdf completion bash)

function asdf_install_latest() {
  lang="$1"

  # Add plugin if without
  [[ `asdf list ${lang}` ]] || asdf plugin add ${lang}

  list=(`asdf list all ${lang}|grep -E '^[0-9]+\.[0-9]+\.[0-9]+$')

  asdf install ${lang} ${list[-1]}
  asdf set -u  ${lang} ${list[-1]}
}
