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

sudo apt install openssh-server fail2ban

cat >> "$HOME/.lastrc" << EOF
function cfg-sshd {
    if which nvim &> /dev/null; then EDITOR=nvim; else EDITOR=vim; fi
    sudoedit /etc/ssh/sshd_config

    read -r -p "Restart SSH service? [y/N]: " answer
    if [[ "\${answer,,}" == y ]]; then
        sudo systemctl restart ssh
        printf 'Restarted SSH service.\n'
    fi
}

# function to regenerate host keys
EOF
