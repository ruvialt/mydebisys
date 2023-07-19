#!/usr/bin/env bash
set -e

# Save the working graphical environment's current configuration.

diroxs="$(dirname "$(readlink -fn "$0")")"

cfgs=( xfce4 gtk-3.0 )

rsync -av --no-links --delete \
    "${cfgs[@]/#/$HOME/.config/}" "$diroxs/homedir/.config"
