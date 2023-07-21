#!/usr/bin/env bash
set -e

# Set up a command-line environment

diroxs="$(dirname "$(readlink -fn "$0")")"

sudo apt update
sudo apt upgrade zsh tmux fzf vim shellcheck

rm -rf "$HOME/.zsh/zsh-autosuggestions"
git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' \
    "$HOME/.zsh/zsh-autosuggestions"

for file in "$diroxs/homedir/."[!.]*; do
    ln -sf "$file" "$HOME/$(basename "$file")"
done

printf "Enter password for '%s'.\n" "$USER"
chsh -s /usr/bin/zsh

printf 'Relog for changes to take effect.\n'
