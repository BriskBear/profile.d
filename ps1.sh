# Set the shell prompt : 
PS1='\u'                                   #  Display Username
PS1+='\[$( errname $? )\]'                 #  Display ]|[ or error code, random-color hostname
PS1+=':\w'                                 #  Display current directory
PS1+='$(__git_ps1 " (%s)" &2> /dev/null) ' #  Git branch and status
PS1+='\n\[$( glyph " " )\]'               #  Display uniform-length prompt-icon
