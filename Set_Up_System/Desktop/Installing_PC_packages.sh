#!/bin/bash

cleanup() {
    echo -e "\nScript interrupted. Existing ..."
    exit 0
}

trap cleanup SIGINT

packageinals=(
    # network utilities
    netctl dhcpcd wpa_supplicant \
    wireshark-cli \
    # wireshark-qt \
    # necessary utilities
	xclip xsel tree unzip which\
    # for imput devices
    xorg-xinput \
    # for shells
	zsh \
	zsh-syntax-highlighting zsh-auto-suggestions \
	terminator tmux \
	# editors
	code gvim \ # крашится, т.к. требует подтверждения на замену стандартного vim
    # file explorers
    thunar, mc \
	# VCS
	git \
	# languages
	go python rust \
	# for programming
	python-pip base-devel cmake \
	# for vim
	# nodejs jdk-openjdk jre-jdk npm \
	# virtualization/conteniarization
	docker kubectl minikube \
    qemu libvirt virt-manager dnsmasq \
    virtualbox virtualbox-guest-utils \  # For VirtualBox
	# CI/CD
	# jenkins \
	# IaC
	ansible \
	# db
	postgresql sqlite \
	# monitoring
	# prometheus \
	# desktop developing
	qtcreator qt5-base qt5-svg qt5-webengine \
	# broswers
	firefox \
    # audio
    pulseaudio pulseaudio-alsa \
	# fonts
	noto-fonts noto-fonts-emoji noto-fonts-extra
    # players
    vlc \
    mvp \ # For Midnight Commander
    # for Media
    # shotcut \ # Requires selection and confirmation
	# others
    transmission-qt \
    redshift \
	obs-studio telegram-desktop obsidian \
)


for package in "${packages[@]}"; do
	echo "Installing $package ..."
    if ! pacman -Q "$package" &> /dev/null; then
    	sudo pacman -Sy --noconfirm "$package"
    else
        echo -e "----- Package $package is installed. -----"
    fi
done
exit 0
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

# -- SHELLS
#
# For Zsh
## zsh by defult shell
chsh -s $(which zsh)
## zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## Oh-my-push
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## powerlevel10k
yay -S zsh-theme-powerlevel10k # --- Проблема. Нужно два раза подтвердить I и I
p10k configure
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# -- SOFTWARE
#
# Docker-desktop
yay -S --noconfirm docker-desktop

# VirtualBox
yay -S --noconfirm virtualbox
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt

# Vim
# Установка с входом в vim. Нужно решить проблему с установкой.
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

# Pomodoro timer

yay -S gnome-shell-pomodoro

# Android Studio

# yay -S android-studio

# Redshift

# Anki

yay -S anki-bin --nonconfirm

# KVM/QUEMU
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -aG libvirt $(whoami)

