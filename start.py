import os
from random import choice
commands=["echo; neofetch" ,"fortune | cowsay -f moose | lolcat", "fortune | cowsay -f tux | lolcat", "fortune | cowsay | lolcat" ,"echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat" ,"echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat; figlet RAQEEB | lolcat", "echo; figlet ASSALAMU | lolcat; figlet ALAIKUM | lolcat; figlet RAQEEB | lolcat"]
randomcommand = choice(commands)
os.system(f"{randomcommand}")
