#!/bin/bash

function setup_git_hooks {
	install_git_hooks
	install_mobilette_git_hooks
}

function install_git_hooks {
	rm -rf /tmp/git-hooks
	git clone https://github.com/icefox/git-hooks /tmp/git-hooks
    if test "$?" -ne 0; then
	    echo "[ERROR] git clone failed for git-hooks repository !"
	    exit 1
	fi
	mv /tmp/git-hooks/git-hooks /usr/local/bin/
}

function install_mobilette_git_hooks {
	rm -rf /tmp/mobilette-git-hooks
	git clone https://github.com/Mobilette/git-hooks /tmp/mobilette-git-hooks
	if test "$?" -ne 0; then
	    echo "[ERROR] git clone failed for Mobilette git-hooks repository !"
	    exit 1
	fi
	mkdir -p ~/.git_hooks/
	cp -r /tmp/mobilette-git-hooks/hooks/* ~/.git_hooks/
}

case "${1}" in
    --help )
        echo "Help please."
        ;;
    --git-hooks )
		install_git_hooks
		;;
	--mobilette-git-hooks )
		install_mobilette_git_hooks
		;;
    * )
		setup_git_hooks
		echo "[SUCCESS] Congratulation you are ready to use correctly git commit :)"
		echo "[NOTE] Do not forget to run git hooks --install in your projects."
		;;
esac