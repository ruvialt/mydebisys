#!/usr/bin/env bash
set -e

# draw.io (or app.diagrams.net) Desktop
# https://github.com/jgraph/drawio-desktop

sudo apt purge draw.io 2> /dev/null || true

releases='https://github.com/jgraph/drawio-desktop/releases'
current="$(
    curl -sL "$releases/latest" |
    grep -Eo 'v{1}([[:digit:]]{1,2}\.){2}[[:digit:]]{1,2}' |
    head -n1 | tr -d 'v'
)"

curl -L -o /tmp/drawio.deb \
    "$releases/download/v$current/drawio-amd64-$current.deb"

sudo apt update
sudo apt upgrade /tmp/drawio.deb
