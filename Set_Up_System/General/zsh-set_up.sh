#!/bin/bash

function zshSetUp {
	if !pacman -Qs zsh > /dev/null; then
		pacman -S --noconfirm zsh
	fi
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	printf 'y\n'
	
	# Install Powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    # Set ZSH by default shell
    chsh -s $(which zsh)
}

zshSetUp
