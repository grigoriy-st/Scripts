#!/bin/bash

echo "Move config files"
echo -e "Choose files to move:\n"

files=(*)

for index in "${!files[@]}"; do
    if [[ "${files[index]}" != "$0" ]]; then
        printf "%2d) %s\n" $index "${files[$index]}"
    fi
done

read -p "Input number: " choice
selected_item="${files[choice]}"

case "$selected_item" in
    vim)
        cp ~/.vimrc ./vim
        echo "vimrc is copied"
    ;;
    terminal\ emulators)
        cp ~/.config/alacritty/alacritty.toml ./terminator/Alacritty/alacritty.toml
        echo "alacritty is copied"
    ;;
# Coming soon...
esac


