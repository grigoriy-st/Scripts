#!/bin/bash

function cleanup() {
    echo -e "\nScript interrupted. Existing ..."
    exit 0
}

trap cleanup SIGINT

packages=(
    # network utilities
    netctl dhcpcd wpa_supplicant \
    wireshark-cli \
    # wireshark-qt \
    # necessary utilities
	xclip xsel tree less unzip which wget \
    dos2unix \
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
    
    # Windows compatible
    ntfs-3g \ 
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
# yay -S -noconfirm postman

# -- SHELLS
#
# For Zsh
./zsh-set_uo.sh
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# -- SOFTWARE
#
# Docker-desktop
# yay -S --noconfirm docker-desktop

# VirtualBox
yay -S --noconfirm virtualbox
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt

# Font
yay -S ttf-cascadia-code

# Vim
./vim-set_up.sh

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

