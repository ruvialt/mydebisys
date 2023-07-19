#!/usr/bin/env bash
set -e

# Install/update essential plugins

plugins_dir="$HOME/.local/share/nvim/site/pack/ages/start"

plugins=(
    'akinsho/bufferline.nvim'
    'dense-analysis/ale'
    'nvim-treesitter/nvim-treesitter'
    'tomasiser/vim-code-dark'
)

rm -rf "$plugins_dir"
mkdir -p "$plugins_dir"

for plugin in "${plugins[@]}"; do
    git -C "$plugins_dir" clone "https://github.com/$plugin.git"
done

sudo apt update
sudo apt upgrade gcc g++
