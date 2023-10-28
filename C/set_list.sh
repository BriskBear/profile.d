# Use a loop to set the 'list' array from terminal : 1698527423

lGreen='\033[38;5;77m'
uncolor='\033[0m'
unset list
declare -a list

echo -e "${lGreen}list${uncolor}=("
read -p '  '
while [[ $REPLY != ')' ]]
do
  list+=("$REPLY")
  read -p '  '
done
echo -e "\033[1A)  "
export list
