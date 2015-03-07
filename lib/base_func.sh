#!/bin/bash


function set_xterm_title () {
	local title="$1"
	echo -ne "\033]0;$title\007" > /dev/stderr
}

# printenv = list all shell variables

# Set xterm title
case "$TERM" in
	xterm*|rxvt*)
	set_xterm_title "$SHELL $USER@$HOSTNAME"
    ;;
*)
    ;;
esac
