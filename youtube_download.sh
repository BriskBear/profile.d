# Download from youtube to flac : 
function youtube-audio() {
  url="${1:-`read -p 'url: ' ; echo $REPLY`}"        # Ask for a url if none was provided 
  [ -z "$url" ] && return -e "URL must have a value" # Quit if there is still no url 
  [[ -d $TMP/youtube ]] || mkdir -pv $TMP/youtube    # Create youtube in private temp unless it exists 

  pushd $TMP/youtube
    yt-dlp -x --audio-format best --restrict-filenames "$url"
    oldName=`ls`
    newName="${oldName%.opus}.flac"

    ffmpeg -i $oldName -strict experimental $newName
    rm -rf $oldName
    mv $newName /tmp/dwn/
  popd
}
