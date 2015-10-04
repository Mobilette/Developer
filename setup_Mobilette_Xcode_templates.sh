#!/bin/bash

function start_Xcode {
	open -a Xcode
}

function setup_Mobilette_Xcode_templates {
	rm -rf /tmp/XcodeTemplates
	git clone https://github.com/Mobilette/XcodeTemplates /tmp/XcodeTemplates
	if test "$?" -ne 0; then
		echo "[ERROR] Fail to clone XcodeTemplates repo (https://github.com/Mobilette/XcodeTemplates)."
		exit 1
	fi
	sudo rm -rf /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Mobilette
	sudo cp -r /tmp/XcodeTemplates/Mobilette /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    --start-Xcode )
		setup_Mobilette_Xcode_templates
		start_Xcode
		;;
    * )
		setup_Mobilette_Xcode_templates
		;;
esac