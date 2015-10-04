#!/bin/bash

function restart_Xcode {
	killall Xcode
	open -a Xcode
}

function setup_VIPER_Xcode_snippets {
	git init
	git remote add origin https://github.com/Mobilette/VIPER-Xcode-Snippets
	git fetch
	git checkout -t origin/master
	git pull
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    * )
		cd ~/Library/Developer/Xcode/UserData/CodeSnippets
		setup_VIPER_Xcode_snippets
		cd -
		restart_Xcode
		;;
esac