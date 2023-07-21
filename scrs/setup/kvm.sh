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

LIBVIRT_DEFAULT_URI='qemu:///system'
export LIBVIRT_DEFAULT_URI

sudo usermod -aG libvirt "$USER"

virsh net-start default
virsh net-autostart default
