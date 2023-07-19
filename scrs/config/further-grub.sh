#!/usr/bin/env bash
set -e

# Further configuration of GRUB

sudo tee -a /etc/default/grub &> /dev/null << EOF

# Appended configurations
GRUB_TIMEOUT=-1
GRUB_BACKGROUND=''
GRUB_THEME=''
EOF

sudo tee -a /etc/grub.d/40_custom &> /dev/null << EOF

# Appended custom entries
menuentry ": shutdown" {
    halt
}
EOF

sudo grub-mkconfig -o /boot/grub/grub.cfg
