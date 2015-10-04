#!/bin/bash

function new_developer {
	case "${1}" in
		ios )
			bash setup_Mobilette_Xcode_templates.sh
			bash setup-VIPER-Xcode-snippets.sh
			;;
		* )
			print_usage
			exit 1
			;;
	esac
	bash git-config.sh "${2}" "${3}" || exit 1
	bash setup-git-hooks.sh || exit 1
}

function update_developer {
	case "${1}" in
		ios )
			bash setup_Mobilette_Xcode_templates.sh
			bash setup-VIPER-Xcode-snippets.sh
			;;
		* )
			print_usage
			exit 1
			;;
	esac
	bash git-config.sh "${2}" "${3}" || exit 1
}

function print_usage {
	echo "[ERROR] Usage: ./developer options type [parameters]"
	echo ""
	echo "  new       add user configuration"
	echo "     ios    add user configuration for iOS developer: USER_NAME USER_EMAIL"
	echo "  update    update user configuration: USER_NAME USER_EMAIL"
	echo "     ios    update user configuration for iOS developer: USER_NAME USER_EMAIL"
	echo "  --help    get more information"
	echo ""
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    new )
		if test "$#" -ne 4; then
			print_usage
			exit 1
		fi
		new_developer "${2}" "${3}" "${4}"
		;;
	update )
		if test "$#" -ne 4; then
			print_usage
			exit 1
		fi
		update_developer "${2}" "${3}" "${4}"
		;;
    * )
		print_usage
		exit 1
		;;
esac