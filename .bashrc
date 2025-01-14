#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

wallset() {
	wal --cols16 -n -i "$@"
	echo -e "preload = $@\nwallpaper = , $@" > ~/.config/hypr/hyprpaper.conf
	killall hyprpaper
	echo -n "Restart Now? (pls ^w^) [Y/n] "
	read "ans"
	if [ $ans = y ] || [ $ans = Y ]; then
    		echo "Ok cya! >w<"
			sleep 0.1
			reboot
	elif [ $ans = n ] || [ $ans = N ]; then
    		echo "ok -w-;"
    		exit 1
	else
    		echo "what? O_O"
    		exit 1
	fi
}

cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh

EDITOR="nvim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
