# Download tar packages from AUR and install them, including dependencies from pacman : 
function aurl() {
  # Prepare Variables
  arguments="${@:2}"
  defaults="-sric --needed --noconfirm"
  dir=$(mktemp -d)
  package=${1,,}
  log=$dir/$package\_log
  url=https://aur.archlinux.org/cgit/aur.git/snapshot/$package.tar.gz
  
  # Download the AUR package to a private RAM directory
  get_package() {
    pushd $dir
      curl -o $package.tgz -L $url --progress-bar
      tar -xzvf $package.tgz
    popd
  }
  
  # Build the AUR package and write the log-file, report result
  make_package() {
    pushd $dir/$package
      makepkg $defaults $arguments &>> $log \
        && echo -e "${LIGHT_GREEN}BUILD SUCCESS!${NC}" \
        || echo -e "${RED} BUILD FAILED:${NC}${RUST} log_file: $log${NC}"
    popd
  }
  
  get_package
  make_package
}
