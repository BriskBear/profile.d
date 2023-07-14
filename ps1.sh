# Set the shell prompt : 1689333741
PS1='\u'                      # Display Username
PS1+='\[$( errname $? )\]'    # Display ]|[ or error code, random-color hostname
PS1+=':\w'                    # Display current directory
PS1+='\n\[$( glyph "" )\] ' # Display uniform-length prompt-icon
