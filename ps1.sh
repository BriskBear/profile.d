# Set the shell prompt : 1674413658
PS1='\u' # Display Username
PS1+='\[$( errname $? )\]' # Display ]|[ or error code, random-color hostname
PS1+=':\w' # Display current directory
PS1+='\n>> ' # Display uniform-length prompt-icon
