#!/usr/bin/env bash
set -e

# Recursively set to preferred permission modes the given directory.

[[ -z $1 ]] \
    && printf 'Usage:$ pref_perms (directory)\n' \
    && exit 1

[[ ! -d $1 ]] \
    && printf "Invalid directory.\n" \
    && exit 1

find "$1" -type f -exec chmod 644 '{}' +
find "$1" -type d -exec chmod 755 '{}' +
find "$1" -type f -name '*.sh' -exec chmod 744 '{}' +
