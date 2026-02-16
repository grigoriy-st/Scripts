#!/bin/bash

function cleanup() {
    echo -e "\nScript interrupted. Existing ..."
    exit 0
}

trap cleanup SIGINT

packages=(
    # network utilities
    netctl dhcpcd wpa_supplicant dnsutils tcpdump httpie
    openssl bind
    wireshark-cli
    # dnsmasq
    # wireshark-qt
    # necessary utilities
	xclip xsel tree less unzip which wget bat
    mupdf dos2unix
    # for shells
	zsh zsh-syntax-highlighting zsh-auto-suggestions
	terminator tmux
	# editors
	code gvim
    # file explorers
    thunar, mc
	# VCS
	git
	# languages
	go python rust
	# for programming
	python-pip base-devel cmake
	nodejs jdk-openjdk jre-jdk npm
	# virtualization/conteniarization
	docker kubectl minikube
    qemu libvirt virt-manager dnsmasq
    virtualbox virtualbox-guest-utils  # For VirtualBox
    # distrobox
	# CI/CD
	# jenkins
	# IaC
	ansible
	# db
	postgresql sqlite
	# monitoring
    btop
	# prometheus
	# desktop developing
	qtcreator qt5-base qt5-svg qt5-webengine
	# broswers
	firefox
    # audio
    pulseaudio pulseaudio-alsa
	# fonts
	noto-fonts noto-fonts-emoji noto-fonts-extra
    # players
    vlc
    mvp# For Midnight Commander
    # for Media
    # shotcut # Requires selection and confirmation
    # Rice 
    # cmatrix
    dmenu
    # Windows compatible
    ntfs-3g 
    # Social media
    telegram-desktop
    discord
	# others
    maim
    transmission-qt
    redshift
	obs-studio  obsidian
    # themes
    gnome-themes-extra
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

# -- YAY packages --\
#
yay_packages=(
    drawio
    clipman
    alse-utils
    # Virtualization
    bottles
    virtualbox
    # Cursor
    bibata-cursor-translucent
    # Font
    ttf-cascadia-code
    gnome-shell-pomodoro,
    anki-bin
    ardour
    debtap
    # android-studio
    # android-sdk
    )

# VirtualBox
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt

# Vim
./vim-set_up.sh


# KVM/QUEMU
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -aG libvirt $(whoami)

# Set Up themes
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
