#!/usr/bin/env bash
set -e

# Unattended Upgrades
# https://wiki.debian.org/UnattendedUpgrades

sudo apt update
sudo apt upgrade unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
