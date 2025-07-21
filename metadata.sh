# Use ffmpeg to add metadata and cover art : 
## Add cover art to a song file
function add-cover-art() {
  [ $# -eq 2 ] || reply -e "add-cover-art <image> <song_file>"

  ext=${2#*.}                                  # song file-extension
  leaf=`awk -F'/' '{print $NF}' <(echo "$2")`  # song file-name (without path)
  stub=/tmp/stub.${ext}                        # temp-file for ffmpeg to write to
  out_dir=$(dirname "`realpath "$2"`")         # folder where the song lives

  case $ext in
    mp3)
      flags="-id3v2_version 3"
      ;;
    flac)
      flags="-disposition:v attached_pic"
      ;;
    *)
      unset flags
      ;;
  esac

  ffmpeg -i "$2" -i "$1" -map 0:0 -map 1:0 -c copy ${flags} -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "$stub" && \
    mv "$stub" "$2"
}

## Create the metadata.txt file from the song file
function edit-metadata() {
  out_dir=$(dirname "`realpath $1`")

  ffmpeg -i "$1" -f ffmetadata "${out_dir}/metadata.txt"
}

## Save the metadata from metadata.txt to the song file
function apply-metadata() {
  [ $# -eq 1 ] || reply -e "apply-metadata <song_file>"

  ext=${1#*.}                            # song file-extension
  leaf=`awk '{print $NF}' <(echo "$2")`  # song file-name (without path)
  stub=/tmp/stub.${ext}                  # temp-file for ffmpeg to write to
  work_dir=$(dirname "`realpath "$1"`")  # folder where song lives

  ffmpeg -i "${work_dir}/$1" -i "${work_dir}/metadata.txt" -map_metadata 1 "$stub" && \
    mv "$stub" "${work_dir}/$1"
}

function read-metadata() {
   ffprobe -i "$1" -hide_banner
}

function rip-cover() {
  [ -r "$1" ] || reply -e "rip-cover <song_file>"

  ffmpeg -i "$1" cover.jpg
}
