# Start i3 automatically on login : 1674413569
[[ $(ps -e|grep -v grep|grep i3) ]] || startx $(which i3)
