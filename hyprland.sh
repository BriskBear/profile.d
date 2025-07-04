# Launch hyprland on login : 

if [[ `which hyprland` ]] && [[ ! `ps -ae|ag hyprland` ]]
then Hyprland
fi
