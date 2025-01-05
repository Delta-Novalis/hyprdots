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

sudo pacman -S sddm hypr{land,lock,idle,paper,land-qtutils} kitty btop waybar pipewire{,-pulse,-alsa,-jack} wireplumber ttf-jetbrains-mono-nerd blueman bluetui
git clone https://aur.archlinux.org/paru.git
cd ./paru
makepkg -si
cd
rm -rf ~/paru

paru -S light hypr{polkitagent,shot}

rm -rf ~/.config/{btop,hypr,kitty,waybar,wofi} && cp -rf ~/hyprdots/config/* ~/.config
mkdir ~/.hyprdots
cp -f ~/hyprdots/misc/version ~/.hyprdots
cp -f ~/hyprdots/scripts/update ~/.hyprdots

user=$(whoami)
sudo usermod -aG video $user
sudo systemctl enable sddm
systemctl --user enable pipewire{,-pulse} wireplumber

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
sleep 1
reboot
