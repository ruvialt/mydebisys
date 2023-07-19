#!/usr/bin/env bash
set -e

# Customize tty messages

diroxs="$(dirname "$(readlink -fn "$0")")"

"$diroxs/func_logins.sh"

read -r -p "Enter a contact information: " contact

sudo tee /etc/issue &> /dev/null << EOF
(\l)

Contact: $contact

To power off the system:
    1. Enter "poweroff" as the login.
    2. Enter nothing for the password.

EOF

[[ -f /etc/motd ]] && printf '\n' | sudo tee /etc/motd &> /dev/null

[[ -f /etc/update-motd.d/10-uname ]] \
    && printf '#!/bin/sh' | sudo tee /etc/update-motd.d/10-uname &> /dev/null
