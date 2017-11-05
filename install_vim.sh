#!/usr/bin/sh

echo "Intalling vim dotfiles"

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/

echo "Done :3"
echo "Just run ':PlugInstall' on vim."
