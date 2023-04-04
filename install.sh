#!/usr/bin/env bash

# FUSE is required for AppImages
if ! dpkg -s fuse >/dev/null 2>&1; then
  sudo apt install -y fuse
fi

if which nvim >/dev/null; then
    echo "Neovim version $(nvim --version | head -1 | awk '{print $2}') is already installed."
else
    # Install Neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
fi

config_dir=~/.config/nvim

if [[ -e $config_dir ]]; then
    read -p "Neovim configuration already exists. Do you want to overwrite it? (y/n) " -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf $config_dir
        mkdir -p $config_dir
        ln -s $(pwd)/nvim/init.vim $config_dir/init.vim
    else
        echo "Exiting neovim configuration setup."
        exit 0
    fi
fi


