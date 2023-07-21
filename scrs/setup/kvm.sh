#!/usr/bin/env bash
set -e

# KVM
# https://wiki.debian.org/KVM

sudo apt update
sudo apt upgrade virt-manager ovmf

cat >> "$HOME/.lastrc" << EOF
LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI
EOF

sudo virsh net-start default
sudo virsh net-autostart default

sudo usermod -aG libvirt "$USER"
printf "Added working user '%s' to group '%s'.\n" "$USER" 'libvirt'
printf 'Relog for group membership change to take effect.\n'
