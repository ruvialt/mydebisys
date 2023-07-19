#!/usr/bin/env bash
set -e

# Run this script in the system that will serve the given
# preconfiguration/preseed file.
#
# Usage:$ ./setup (preconfiguration/preseed_file)

[[ ! -f "$1" ]] \
    && printf "Error: '%s' is not a valid file." "$1" \
    && exit 1

if ! dpkg -s tftpd-hpa &> /dev/null; then
    sudo apt update
    sudo apt upgrade tftpd-hpa
    sudo systemctl disable tftpd-hpa.service
fi

! systemctl status tftpd-hpa &> /dev/null \
    && sudo systemctl start tftpd-hpa.service

sudo cp "$1" /srv/tftp      # Access in the client via:
                            # tftp://[preseed_srv_ip]/[filename]
