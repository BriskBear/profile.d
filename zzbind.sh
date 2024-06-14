# CMDline keyboard shortcuts : 
bind -x '"\C-l": "clear -x;date|lolcat"' 2>/dev/null
bind '"kj": "\e"' 2>/dev/null
bind -x '"\C-p": "git stash --all; git pull"'
bind -x '"\C-r": "restart-shell"'

# Surrounding Elements
bind '"``":"`kjmha`kj`ha"'
bind '"\"\"":"\"kjmha\"kj`ha"'
bind '"\(\(":"\(kjmha\)kj`ha"'
bind '"\{\{":"\{kjmha\}kj`ha"'
bind '"\[\[":"\[kjmha\]kj`ha"'
bind '"\[\[ ":"\[ kjmha \]kj`ha"'
