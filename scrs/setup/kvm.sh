#!/usr/bin/env bash
set -e

# KVM
# https://wiki.debian.org/KVM

sudo apt update
sudo apt upgrade qemu-system libvirt-daemon-system virt-manager ovmf

sudo adduser "$USER" libvirt
