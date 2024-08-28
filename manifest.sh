# Create a file manifest with MD5 sums of files and sign it : 

function manifest() {
  # Import External Tools
  . $HOME/.local/etc/profile.d/01reply.sh
  
  # Exit unless there is a manifest list
  [[ -r manifest.list ]] || reply -e 'Create a manifest.list of the files you want to include'
  
  # Make a Pretty table
  COLUMNS='MD5 Checksum:                     Filename:'
  FILE_LIST=(`cat manifest.list`)
  HEADER='----------------------------------------------------'
  OUT_FILE='manifest'
  
  # Print the top of the file
  echo "$COLUMNS" > "$OUT_FILE"
  echo "$HEADER" >> "$OUT_FILE"
  
  # Write the MD5 file checksums
  for file in ${FILE_LIST[@]}
  do
    md5sum "$file" >> "$OUT_FILE"
  done
  
  # Sign the manifest
  gpg --clear-sign "$OUT_FILE"
  mv "$OUT_FILE".asc "$OUT_FILE"
}

function verify() {
  CHECK_FILE="$1"
  claimsums=(`tail -n+6 "$CHECK_FILE"|head -n-14`)
  
  # Exit if the signature is bad
  gpg --verify "$CHECK_FILE" 2>/dev/null && reply -i "$CHECK_FILE is valid" || reply -e "$CHECK_FILE failed validation"

  for (( idx=0; idx<$((${#claimsums[@]} - 1)); idx+=2 ))
  do
    printf "${claimsums[$(($idx + 1))]}: "
    sum=(`md5sum ${claimsums[$(($idx + 1))]}`)
    [[ "${sum[0]}" == "${claimsums[$idx]}" ]] && echo -e "\033[38;5;34mValid\033[0m" || reply -w 'Failed validation'
  done
}
