#!/bin/bash

function restart_Xcode {
	killall Xcode
	open -a Xcode
}

function setup_VIPER_Xcode_snippets {
	sudo git init
	sudo git remote add origin https://github.com/Mobilette/VIPER-Xcode-Snippets
	sudo git fetch
	sudo git checkout -t origin/master
	sudo git pull
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    * )
		sudo mkdir ~/Library/Developer/Xcode/UserData/CodeSnippets
		cd ~/Library/Developer/Xcode/UserData/CodeSnippets
		setup_VIPER_Xcode_snippets
		cd -
		restart_Xcode
		;;
esac