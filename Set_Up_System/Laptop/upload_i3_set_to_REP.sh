#!/bin/bash

cp ~/.config/i3/config ./.config/i3/

if [ $? -eq 0 ]; then
    echo "Copying is SUCCESSFULLY from /.config/i3/."
else
    echo "Error when copying."
fi

cp -r /etc/i3* ./etc/

if [ $? -eq 0 ]; then
    echo "Copying is SUCCESSFULLY from /etc."
else
    echo "Error when copying."
fi

