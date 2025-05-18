!/bin/bash
#
# Need to install conf files:
# oh-my-push, terminal, vscode, 
#

cd ../config_files # select folder with config files

read -p "This is PC or laptop? (pc,laptop)" device

if [ "$device" == "laptop" ]; then
	# Update .bashrc
	cp shells/bash/.bashrc ~/.bashrc

	# Update .zshrc
	cp shells/zsh/.zshrc ~/.zshrc

	# Update .vimrc
	cp vim/.vimrc ~/.vimrc
	
	cd "Windows Managers"

	# Set up i3 for laptop
	cd i3-laptop

	# replace main i3 config file
	cp i3/config ~/.config/i3/
	
	# replace i3 config files from /etc/
	cp /etc/i3status.conf ~/etc/

elif [ "$device" == "pc" ]; then

	# Update .zshrc
	cp shells/zsh/.zshrc ~/.zshrc
	if [ $? -eq 0 ]; then
	    echo "Copying .zshrc is SUCCESSFULLY"
	else
	    echo "Error when copying .zshrc."
	fi
	
	# Update .vimrc
	cp vim/.vimrc ~/.vimrc
	if [ $? -eq 0 ]; then
	    echo "Copying .vimrc is SUCCESSFULLY"
	else
	    echo "Error when copying .vimrc."
	fi
fi


