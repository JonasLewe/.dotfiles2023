#!/usr/bin/env bash

rm -rf ~/.config/nvim

mkdir ~/.config

ln -s $(pwd)/nvim ~/.config/nvim
