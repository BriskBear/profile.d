# Buffer with directory-length
function buffer() {
  here=$(pwd|sed "s|${HOME}||")
  echo "${#USER} + ${#HOSTNAME} + ${#here} + 8"|bc
}
