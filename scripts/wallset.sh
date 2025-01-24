#! /bin/bash

read "dir"
if ! [[ "$dir" == *"-S "* ]]; then
	wal --cols16 -n -i "~/.config/hypr/wallpaper/$dir"
	echo -e "preload = ~/.config/hypr/wallpaper/$dir\nwallpaper = , ~/.config/hypr/wallpaper/$dir" > ~/.config/hypr/hyprpaper.conf
else
	wal --cols16 -n -i "$dir"
	echo -e "preload = $dir\nwallpaper = , $dir" > ~/.config/hypr/hyprpaper.conf
fi

killall hyprpaper

echo -n "Restart Now? (pls ^w^) [Y/n] "
read "ans"
if [ $ans = y ] || [ $ans = Y ]; then
		echo "Ok cya! >w<"
		sleep 0.1
		reboot
elif [ $ans = n ] || [ $ans = N ]; then
		echo "ok it might be broken -w-;"
		exit 1
else
		echo "eh? O_O"
		exit 1
fi