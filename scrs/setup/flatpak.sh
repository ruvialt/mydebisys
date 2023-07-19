#!/usr/bin/env bash
set -e

# Flatpak
# https://wiki.debian.org/Flatpak

sudo apt update
sudo apt upgrade flatpak
sudo apt purge xdg-desktop-portal-gtk xdg-user-dirs

flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo
