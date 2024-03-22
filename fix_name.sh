# Fix filenames : 
function fix-name() {
  name="$1"
  remstr="${@:2}"

  for str in ${remstr[@]}
  do
    name=`echo "$name"|sed -e "s/${str}//g"`
  done
  nName=`echo "$name"|sed -e "s/_-_/-/g ; s/\._/-/g ; s/-\[.\+\]//g"`
  mv -v "${1}" "${nName}"
}
