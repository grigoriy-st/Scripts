#!/bin/bash

packages=(
	# terminals
	zsh \
	zsh-syntax-highlighting zsh-auto-suggestions \
	terminator \
	# editors
	code gvim \
	#vsc
	git \
	# languages
	go python rust \
	# for programming
	python-pip base-devel cmake \
	# for vim
	# nodejs jdk-openjdk jre-jdk npm \
	# virtualization/conteniarization
	docker kubectl minikube \
	# CI/CD
	jenkins \
	# IaC
	ansible \
	# db
	postgresql sqlite \
	# monitoring
	prometheus \
	#desktop developing
	qtcreator qt5-base qt5-svg qt5-webengine \
	#broswers
	firefox \

	# fonts
	noto-fonts noto-fonts-emoji noto-fonts-extra
	# others
	obs-studio telegram-desktop thunar xclip xsel tree\
	)

for package in "${packages[@]}"; do
	echo "Installing $package ..."
	sudo pacman -Sy --noconfirm "$package"
done

# --- Additional settings for installd packages ---
#
# Start dockerd
sudo systemctl start docker
sudo systemctl enable docker

# --- Installing additional packages
# yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && sudo rm -r yay

# Postman
yay -S -noconfirm postman

# For Zsh
## zsh by defult shell
chsh -s $(which zsh)
## Oh-my-push
curl -s https://ohmyposh.dev/install.sh | bash
echo 'eval "$(oh-my-posh init zsh --config ~/path/to/your/theme.omp.json)"' > ~/.zshrc
source ~/.zshrc

# VirtualBox
yay -S --noconfirm virtualbox
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt

# Vim
## Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa'
## Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall' -c 'qa'
# YouCompleteMe

cd ~/.vim/bundle/youcompleteme
python3 install.py --go-completer


