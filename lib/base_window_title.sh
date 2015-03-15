#!/bin/bash


# printenv = list all shell variables


_set_local_scriptname "$BASH_SOURCE"


function set_xterm_title () {
	local title="$1"
	# while sleep 1;
	# 	do echo -ne '\033]2;'$title' - '`date +\%x`', '`/usr/bin/uptime`'\007';
	# 	#do echo -ne '\033]2;'`/bin/hostname`' - '`date +\%a\ %b\ %d`', '`/usr/bin/uptime`'\007';done&
	# done&
	echo -ne '\033]0;'$title' - '`date +\%x`' \007' > /dev/stderr
}


# Set xterm title
case "$TERM" in
	xterm*|rxvt*)
	set_xterm_title "$USER@$HOSTNAME $SHELL"
    ;;
*)
    ;;
esac
