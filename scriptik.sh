#!/bin/bash

cd ~/

apt install git sudo tmux


curl -O https://raw.githubusercontent.com/grigoriy-st/scripts/master/.vimrc
curl -O https://raw.githubusercontent.com/grigoriy-st/scripts/master/.tmux.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.poshthemes
curl -L https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kali.omp.json -o ~/.poshthemes/kali.omp.json

curl -s https://ohmyposh.dev/install.sh | bash -s

if ! grep -q "oh-my-posh.*kali" ~/.zshrc; then
    echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/kali.omp.json)"' >> ~/.zshrc
fi

source ~/.zshrc
