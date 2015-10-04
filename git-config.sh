#!/bin/bash

## TODO:
## We should use commit.template to specify a commit template.
##

## TODO:
## We should use Kaleoscope to fix conflicts
## git config --global merge.tool extMerge
##

## TODO:
## We should send an email to managers 
## for adding the new developer to Mobilette services
##

function setup_git_color {
	git config --global color.ui true
}

function setup_git_user_name {
	git config --global user.name "${1}"
}

function setup_git_user_email {
	git config --global user.email "${1}"
}

function print_usage {
	echo "[ERROR] Usage: ./git-config USER_NAME USER_EMAIL"
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    * )
		if test "$#" -ne 2; then
			print_usage
			exit 1
		fi
		setup_git_color
		setup_git_user_name "${1}"
		setup_git_user_email "${2}"
		echo "[SUCCESS] You are the best mobilette driver in the world and your name is ${1}!"
		;;
esac