# Create default RAM downloads folder, and personal-permission tmpfs : 
[[ -d /tmp/dwn ]] || mkdir /tmp/dwn

tmpfs=(`/usr/bin/ls -F /tmp|ag '\/$'|ag 'tmp\.'`)

[[ -n $tmpfs ]] && export TMP=`echo /tmp/${tmpfs[0]}|sed 's/\/$//g'` || export TMP=$(mktemp -d)
