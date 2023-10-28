#!/usr/bin/env bash
set -e

# https://github.com/GNS3/gns3-server

diroxs="$(dirname "$(readlink -fn "$0")")"

sudo apt update
sudo xargs -a "$diroxs/deps" apt upgrade

python3 -m venv "$HOME/.venv-gns3"

# shellcheck disable=SC1091
. "$HOME/.venv-gns3/bin/activate"

pip install pyqt5 gns3-server gns3-gui

deactivate

#cat >> "$HOME/.lastrc" << EOF
#echo
#EOF
