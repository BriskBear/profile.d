# Create default RAM downloads folder, and personal-permission tmpfs : 
[[ -d /tmp/dwn ]] || mkdir /tmp/dwn

tmpfs=$(ls -F /tmp|ag '\/$'|ag 'tmp\.')

[[ -n $tmpfs ]] && export TMP=/tmp/${tmpfs[0]} || export TMP=$(mktemp -d)
