# Download from youtube to flac : 
[[ -r $XP/01reply.sh ]] && . $XP/01reply.sh

## Remove cruft, lowercase and replace '.opus' with '.flac'
function fix_name() {
  echo "$1"                |
    sed 's/_-_/-/g'        |
    sed 's/-\[.\+\]//g'    |
    sed 's/_Audio//g'      |
    sed 's/\.opus/.flac/g' |
    tr '[:upper:]' '[:lower:]'
}

## Improve file names, and convert to flac
function youtube-convert() {
  pushd $TMP/youtube 
    old_names=(`ls`)

    for name in "${old_names[@]}"
    do
      new_name=`fix_name "$name"`

      ffmpeg -i $name -strict experimental "$new_name"

      [[ -r "$new_name" ]] && rm -rf "$name"
    done
  popd
}

## Download a file / playlist to $TMP/youtube
function youtube-download() {
  # Confirm Dependency
  [[ `yt-dlp --help 2>/dev/null` ]] || reply -e "Please install yt-dlp" 127
  url="${1:-`read -p 'url: ' ; echo $REPLY`}"         # Ask for a url if none was provided

  [ -z "$url" ] && return -e "URL must have a value"  # Quit if there is still no url
  [[ -d $TMP/youtube ]] || mkdir -pv $TMP/youtube     # Create youtube in private temp unless it exists

  pushd $TMP/youtube
    yt-dlp -x --audio-format best --restrict-filenames "$url"
  popd
}

