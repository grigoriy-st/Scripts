#!/bin/bash

cleanup() {
    echo -e "\nScript interrupted. Existing ..."
    exit 0
}

trap cleanup SIGINT

packages=(
    # network utilities
    netctl dhcpcd wpa_supplicant \
    wireshark-cli \
    # for imput devices
    xorg-xinput \
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
