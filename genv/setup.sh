#!/usr/bin/env bash
set -e

# Set up a graphical environment

diroxs="$(dirname "$(readlink -fn "$0")")"

sudo apt update
sudo apt upgrade xorg xfce4 \
    xfce4-terminal xfce4-whiskermenu-plugin xfce4-clipman-plugin \
    xfce4-power-manager xfce4-notifyd xfce4-screenshooter \
    thunar-archive-plugin thunar-media-tags-plugin \
    network-manager-gnome \
    papirus-icon-theme adwaita-icon-theme \
    fonts-noto-core fonts-dejavu-core

sudo apt purge lightdm lightdm-gtk-greeter xdg-user-dirs

mkdir -p "$HOME/.themes" && "$diroxs/cus-matcha.sh" "$HOME/.themes"

curl -sL 'https://git.io/papirus-folders-install' | env PREFIX="$HOME/.local" sh

"$HOME/.local/bin/papirus-folders" --color grey --theme Papirus

sudo cp -f "$diroxs/images/152233.png" /usr/share/backgrounds

rsync -av "$diroxs/homedir/" "$HOME" && sleep 2
rsync -av "$diroxs/homedir/" "$HOME"

mkdir -p "$HOME/bin"
ln -sf "$diroxs/save-cfg.sh" "$HOME/bin/save-genv"

printf 'exec startxfce4\n' > "$HOME/.xinitrc"
