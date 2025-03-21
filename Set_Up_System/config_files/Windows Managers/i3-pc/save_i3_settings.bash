#!/bin/bash

cp -r ~/.config/i3* .

if [ $? -eq 0 ]; then
    echo "Copying is SUCCESSFULLY."
else
    echo "Error when copying."
fi

