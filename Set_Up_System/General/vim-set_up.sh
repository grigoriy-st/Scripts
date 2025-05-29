#!/bin/bash

set_up_vim_plugin_managers() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

set_up_vim_plugins() {
    vim +PluginInstall +qall

    # Install YouCompleteMe plugin
    cd ~/.vim/bundle/youcompleteme
    python3 install.py --clangd-completer --go-completer --rust-completer
}

set_up_vim_plugin_managers
set_up_vim_plugins

