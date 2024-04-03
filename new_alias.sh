# Create a new persistent alias : 
function new-alias() {
  action="$2"
  description="$3"
  name="$1"

  echo "alias $name='$action' # $description" | sudo tee -a /etc/profile.d/aliases.sh
}

alias na='new-alias'
