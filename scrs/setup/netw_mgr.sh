#!/usr/bin/env bash
set -e

# NetworkManager
# https://wiki.debian.org/NetworkManager
# https://wiki.debian.org/NetworkManager/iwd

sudo apt update
sudo apt upgrade network-manager iwd

sudo sed -i '0,/^managed=false$/s//managed=true/' \
    /etc/NetworkManager/NetworkManager.conf

sudo tee /etc/NetworkManager/conf.d/iwd.conf &> /dev/null << EOF
[device]
wifi.backend=iwd
EOF

sudo systemctl stop NetworkManager.service
sudo systemctl disable --now wpa_supplicant.service
sudo systemctl enable --now NetworkManager.service

printf 'Reboot.\n'
