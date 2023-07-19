#!/usr/bin/env bash
set -e

# OpenSSH
# https://wiki.debian.org/SSH

sudo apt update
sudo apt upgrade openssh-client

if [[ ! -f "$HOME/.ssh/id_rsa" ]]; then
    ssh-keygen -t rsa -f "$HOME/.ssh/id_rsa"
fi

read -r -p "Set up an SSH server? [y/N]: " answer
if [[ ! ${answer,,} == y ]]; then exit; fi

sudo apt install openssh-server fail2ban nftables
