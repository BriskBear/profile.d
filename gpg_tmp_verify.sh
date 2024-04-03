# Verify the gpg signature of a file from a users github account : 
function gpg_tmp_verify() {
   [[ $# < 1 ]] && reply -e "Usage: gpg_tmp_verify <signature> [user]"

   leaf="$1"
   user="$2"
   tmp=
   trap 'rm -rf "$tmp"' EXIT INT TERM HUP
   tmp=`mktemp -d`
   export GNUPGHOME="$tmp"
   curl -#Lo $tmp/keys.asc https://github.com/${user:-`git config user.name`}.gpg
   gpg --import $tmp/keys.asc 2>>$TMP/tmp-verify.log
   gpg --verify "$1" 2>&1|grep --color '^gpg: .\{3,4\} signature'

   rm -rfv $tmp &>>$TMP/tmp-verify.log
   unset GNUPGHOME
}
