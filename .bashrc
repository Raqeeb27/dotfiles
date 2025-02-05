HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=10000
HISTFILE=~/.bash_history

if [ -f ~/.termux_aliases ]; then
    . ~/.termux_aliases
fi

if [ -f ~/.termux_apps ]; then
    . ~/.termux_apps
fi


clear
export LAST_UPDATE_FILE=~/../.last_update
export TODAY=$(date +%d-%m-%Y)

# trap 'PROMPT_COMMAND="echo";eval "$(starship init bash)"' INT

#if [ ! -f "$LAST_UPDATE_FILE" ] || [ "$(cat "$LAST_UPDATE_FILE")" != "$TODAY" ]; then
 #   echo -e "Updating system...\n"
  #  apt update && apt upgrade -y
   # apt autoremove -y
   # echo "$TODAY" > "$LAST_UPDATE_FILE"
#fi


# ------------Random display on Startup -------------------

clear

date +"%A, %d %B %Y, %I:%M:%S %p" | lolcat

echo

echo "Welcome back, RAQEEB @ Termux.bash" | lolcat

commands=("echo; neofetch" "fortune | cowsay -f moose | lolcat" "fortune | cowsay -f tux | lolcat" "fortune | cowsay | lolcat" "echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat" "echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat; figlet RAQEEB | lolcat" "echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat; figlet RAQEEB | lolcat")

eval "${commands[RANDOM % ${#commands[@]}]}"

figlet -f small '   MY BASH' | lolcat

echo

#figlet "Read Quran!" | lolcat

PROMPT_COMMAND="echo"

eval "$(starship init bash)"
