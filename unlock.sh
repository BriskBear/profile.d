# Place the credentials file for the specified repository : 1690474990
function unlock() {
  # Append rc to the name of the config file
  repo=$1rc

  # Create a temporary credentials folder only 'this' user can access
  mkdir -m 700 /tmp/.cred

  # Decrypt the stored credentials file to the restricted-temporary space
  gpg -d $HOME/.config/.cred/${repo%rc}.gpg >> /tmp/.cred/$repo

  [[ -L .env ]] || ln -si /tmp/.cred/$repo .env
}
