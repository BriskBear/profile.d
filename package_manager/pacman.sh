# Archlinux package_manager shortcuts
function arch-update() {
   $doas pacman -Scc --noconfirm
   $doas pacman -Sy --noconfirm archlinux-keyring
   $doas pacman -Syu --noconfirm
}

alias clean='$doas pacman -Scc'
alias purge='$doas pacman -Rcc'
alias setup='$doas pacman -Sy --noconfirm'
alias update='arch-update'
