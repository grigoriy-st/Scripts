!/bin/bash

if test -d /Documents/__REMOTE__; then
	cd /Documents/__REMOTE__
	if ! test -d Scripts; then
		git clone git@github.com:grigoriy-st/Scripts.git
	fi
	# Update local conf-files fro, repository Script
	
