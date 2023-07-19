#!/usr/bin/env bash
set -e

# Install a customized version of Matcha to the given directory.

azul=/tmp/Matcha-azul

[[ -z $1 ]] \
    && printf "Usage:\$ ./cus-matcha.sh [directory]\n" \
    && exit 1

[[ ! -d $1 ]] \
    && printf "Invalid directory.\n" \
    && exit 1

sudo apt update
sudo apt upgrade imagemagick

rm -rfv /tmp/[mM]atcha*
git clone 'https://github.com/vinceliuice/Matcha-gtk-theme.git' /tmp/matcha_repo
/tmp/matcha_repo/install.sh -d /tmp -c standard -t azul

sed_subs=(
    's/Matcha-azul/cus-matcha/g'
    's/1b1d24/111111/g'
    's/262933/222222/g'
    's/313441/333333/g'
    )
for sed_sub in "${sed_subs[@]}"; do
    find "$azul" -type f -exec sed -i "$sed_sub" {} \;
done

for F in "$azul/xfwm4/"*.png; do 
    convert -fill '#111111' -opaque '#1b1d24' "$F" "${F%.*}.png"
done

for F in "$azul/xfwm4/"*-inactive.png; do
    convert -fill '#222222' -opaque '#111111' "$F" "${F%.*}.png"
done

rsync -av --delete "$azul/" "$1/cus-matcha"
