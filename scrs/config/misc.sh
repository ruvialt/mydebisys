#!/usr/bin/env bash
set -e

# Miscellaneous

## Remove stupid beeps
printf '%s\n' "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf \
    &> /dev/null

## Shorten 'systemctl poweroff' and 'systemctl reboot' to 'poweroff' and
## 'reboot', respectively.
dir=/usr/bin

[[ ! -f $dir/poweroff ]] \
    && sudo ln -s $dir/systemctl $dir/poweroff

[[ ! -f $dir/reboot ]] \
    && sudo ln -s $dir/systemctl $dir/reboot

# Configure 'apt autoremove' to actually remove unnecessary dependencies.
# https://unix.stackexchange.com/a/394458
printf '\n%s\n' 'Apt::AutoRemove::SuggestsImportant "false" ;' |
    sudo tee -a /etc/apt/apt.conf.d/01autoremove &> /dev/null

## Disable touchscreen (X.Org)
mapfile -t files <<< \
    "$(grep -rlw 'touchscreen catchall' /usr/share/X11/xorg.conf.d)"

match="touchscreen catchall\""
insert="        Option \"Ignore\" \"on\""

for file in "${files[@]}"; do
    sudo sed -i "s/$match/$match\n$insert/" "$file"
done

printf 'Restart X.Org.\n'
