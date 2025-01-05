#! /bin/bash

cd

if [ $(whoami) = root ]; then
    echo "no root sessions allowed >_<"
    exit 1
fi

echo -n "Start the update now? [Y/n] "
read ans1

if [ $ans1 = y ] || [ $ans1 = Y ]; then
    echo "Ok update starting ^-^"
elif [ $ans1 = n ] || [ $ans1 = N ]; then
    echo "ok T-T"
    exit 1
else
    echo "what? O_O"
    exit 1
fi

sudo pacman -Syu

cd
rm -rf ~/hyprdots
git clone https://github.com/Delta-Novalis/hyprdots
if cmp ~/.hyprdots/version ~/hyprdots/misc/version; then
    echo "Your up to date ^-^"
fi
cp ~/.config/hypr/hyprpaper.conf ~/.hyprdots
rm -rf ~/.config/{btop,hypr,kitty,waybar,wofi} && cp -rf ~/hyprdots/config/* ~/.config
rm -f ~/.config/hypr/hyprpaper.conf && cp -f ~/.hyprdots/hyprpaper.conf ~/.config/hypr
rm -f ~/.hyprdots/update.sh && cp -f ~/hyprdots/scripts/update.sh ~/.hyprdots
rm -f ~/.hyprdots/hyprpaper.conf
cp -f ~/hyprdots/misc/version ~/.hyprdots

echo "Update done ^w^"
