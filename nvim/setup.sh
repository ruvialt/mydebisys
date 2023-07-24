#!/usr/bin/env bash
set -e

# Set up Neovim

diroxs="$(dirname "$(readlink -fn "$0")")"

curl -L -o /tmp/nvim.tgz 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'
sudo rm -rf /opt/nvim-linux64
sudo tar xzvf /tmp/nvim.tgz -C /opt
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

sudo apt update

rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/plugin"

ln -s "$diroxs/configs" "$HOME/.config/nvim/plugin/configs"

"$diroxs/plugins.sh"
