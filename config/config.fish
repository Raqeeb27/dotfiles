#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

set fish_greeting ""

if test -f ~/.termux_apps
    source ~/.termux_apps
end

if test -f ~/.termux_aliases
    source ~/.termux_aliases
end

# ------------Random display on Startup -------------------

clear

date +"%A, %d %B %Y, %I:%M:%S %p" | lolcat

echo

echo "Welcome back, RAQEEB @ Termux.fish" | lolcat

python ~/../start.py

figlet -f small '   MY FISH' | lolcat

starship init fish | source
