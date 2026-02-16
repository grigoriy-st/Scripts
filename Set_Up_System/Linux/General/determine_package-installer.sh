#!/bin/bash

trap cleanup SIGINT SIGTERM
cleanup() {
    exit 1
}

mapfile -t installed_packages < <(pacman -Qq)
# installed_packages=("htop" "debtap" "ttf-cascadia-code" "ardour" "ansible")  # for example

pacman_packages=()
yay_packages=()
unknown_packages=()

total=${#installed_packages[@]}
current=0

for package in "${installed_packages[@]}"; do
    ((current++))
    percent=$((100*current/total))
    

    if pacman -Si "$package" &>/dev/null; then
        pacman_packages+=("$package")
    elif yay -Si "$package" &>/dev/null; then
        yay_packages+=("$package")
    else
        unknown_packages+=("$package")
    fi
    printf "\rProgress: %d of %d (%d%%)" "$current" "$total" "$percent"
    sleep 0.1
done

echo -e "\nPacman packages"
for pacman_pkg in "${pacman_packages[@]}"; do
    echo "$pacman_pkg" >> "pacman_packages.txt"
done

echo -e "\nYay packages"
for yay_pkg in "${yay_packages[@]}"; do
    echo "$yay_pkg" >> "yay_packages.txt"
done

echo -e "\nUnknown packages"
for package in "${unknown_packages}"; do
    echo "$package" >> "unknown_packages.txt"
done
