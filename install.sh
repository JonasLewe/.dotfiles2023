#!/usr/bin/env bash

rm -rf ~/.config/nvim

mkdir -p ~/.config/nvim

ln -s $(pwd)/nvim ~/.config/nvim
