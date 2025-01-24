#! /bin/bash

cd

if [ $(whoami) = root ]; then
    echo "no root sessions allowed >_<"
    exit 1
fi

echo -n "Start the installation now? [Y/n] "
read ans1

if [ $ans1 = y ] || [ $ans1 = Y ]; then
    echo "Ok installation starting ^-^"
elif [ $ans1 = n ] || [ $ans1 = N ]; then
    echo "ok T-T"
    exit 1
else
    echo "what? O_O"
    exit 1
fi

sudo pacman -Syu

sudo pacman -S sddm hypr{land,lock,idle,paper,land-qtutils} kitty btop waybar pipewire{,-pulse,-alsa,-jack} wireplumber alsa-utils ttf-jetbrains-mono-nerd blueman wofi xdg-desktop-portal-{gtk,hyprland} qt6ct pavucontrol
git clone https://aur.archlinux.org/paru-bin.git
cd ./paru-bin
makepkg -si
cd
rm -rf ~/paru-bin

paru -S light hypr{polkitagent-bin,shot} python-pywal16

rm -rf ~/.config/{btop,hypr,kitty,waybar,wofi} && cp -rf ~/hyprdots/config/* ~/.config
mkdir ~/.hyprdots
cp -f ~/hyprdots/misc/version ~/.hyprdots
cp -f ~/hyprdots/scripts/update.sh ~/.hyprdots
mkdir -p ~/.local/bin
cp -f ~/hyprdots/scripts/wallset.sh ~/.local/bin

sudo usermod -aG video $USER
sudo systemctl enable sddm bluetooth
systemctl --user enable pipewire{,-pulse} wireplumber

wal --cols16 -n -i "~/.config/hypr/wallpaper/Sunset9.jpg"
echo -e "preload = ~/.config/hypr/wallpaper/Sunset9.jpg\nwallpaper = , ~/.config/hypr/wallpaper/Sunset9.jpg" > ~/.config/hypr/hyprpaper.conf

echo -n "..5"
sleep 1
echo -n "..4"
sleep 1
echo -n "..3"
sleep 1
echo -n "..2"
sleep 1
echo "..1"
sleep 1
echo "cya ^w^"
sleep 0.1
reboot